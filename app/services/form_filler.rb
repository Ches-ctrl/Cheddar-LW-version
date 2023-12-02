require 'capybara/rails'
require 'capybara/dsl'

class FormFiller
  include Capybara::DSL

  # TODO: Move to config intializers
  # TODO: Review code for inefficient loops and potential optimisations
  # TODO: Add ruby monitoring tools to monitor performance and execution
  # TODO: Implement caching for both user and form inputs. At the moment we request the database every time we want an input
  # TODO: Cache values at beginning of session and then update cache when user changes values
  # TODO: Enable multi-job application support in form_filler and cache before all applications are submitted

  # Could we implement caching for form inputs? So once you've done it once it becomes less intensive
  # Could change to a more lighweight browser e.g. firefox to speed up the process

  def initialize
    Capybara.run_server = false

    if Rails.env.production?
      Capybara.register_driver :selenium do |app|
        chrome_bin = ENV.fetch('GOOGLE_CHROME_SHIM', nil)
        # p chrome_bin
        chrome_opts = chrome_bin ? { "binary" => chrome_bin } : {}
        # p chrome_opts
        Selenium::WebDriver::Chrome.path = chrome_bin
        Capybara::Selenium::Driver.new(
          app,
          browser: :chrome,
          options: Selenium::WebDriver::Options.chrome
        )
      end
      Capybara.javascript_driver = :selenium
      Capybara.default_driver = :selenium
    else
      Capybara.register_driver :selenium do |app|
        options = Selenium::WebDriver::Chrome::Options.new
        # options.add_argument("--headless")
        options.add_argument("--no-sandbox")
        options.add_argument("--window-size=1400,1000")
        # options.add_argument("--disable-gpu")
        options.add_argument("--disable-dev-shm-usage")
        options.add_argument("--remote-debugging-port=9225")
        Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
      end
      Capybara.ignore_hidden_elements = false
      Capybara.default_driver = :selenium
      Capybara.javascript_driver = :selenium
    end
    # fill_out_form
  end

  # TODO: Move to application jobs controller when complete. This will run as a background job.
  # TODO: Find all available locators before running the function, then run through
  # TODO: Restrict search to certain portions of the page
  # TODO: Redo temporary save and open for screenshots
  # TODO: Set locators and then don't rerun function every time

  def fill_out_form(url, fields, job_application_id)
    visit(url)
    find_apply_button.click

    fields.each do |field|
      field = field[1]
      case field['interaction']
      when 'input'
        # p "Inputting #{field['value']} based on locator: #{field['locators']}"
        fill_in(field['locators'], with: field['value'])
      when 'combobox'
        select_option_from_combobox(field['locators'], field['option'], field['value'])
      when 'radiogroup'
        select_option_from_radiogroup(field['locators'], field['option'], field['value'])
      when 'listbox'
        select_option_from_listbox(field['locators'])
      when 'select'
        select_option_from_select(field['locators'], field['option'], field['value'])
      when 'upload'
        upload_file(field['locators'], field['value'])
      end
    end
    # Return a screenshot of the submitted form
    take_screenshot_and_store(job_application_id)
    close_session
  end

  private

  def close_session
    Capybara.send(:session_pool).each { |name, ses| ses.driver.quit }
  end

  def find_apply_button
    find(:xpath, "//a[contains(translate(., 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), 'apply')] | //button[contains(translate(., 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), 'apply')]")
  end

  def select_option_from_combobox(combobox_locator, option_locator, option_text)
    find(combobox_locator).click
    all(option_locator, text: option_text, visible: true)[0].click
  end

  def select_option_from_radiogroup(radiogroup_locator, option_locator, option_text)
    within(radiogroup_locator) do
      find(option_locator, text: option_text).click
    end
  end

  def select_option_from_listbox(listbox_locator)
    all("#{listbox_locator} li")[0].click
  end

  def select_option_from_select(listbox_locator, option_locator, option_text)
    begin
      within listbox_locator do
        find(option_locator, text: option_text).click
      end
    rescue Selenium::WebDriver::Error::ElementNotInteractableError
      p 'cannot interact with hidden element'
      p listbox_locator
      new_locator = page.find("label #{listbox_locator}")
      p new_locator
      new_locator.ancestor("label").find("a").click
      find("div.select2-drop li", text: option_text).click
    end
  end

  def upload_file(upload_locator, file)
    begin
      find(upload_locator).attach_file(file)
    rescue Capybara::ElementNotFound
      page.attach_file(file) do
        page.find(upload_locator).click
      end
    end
  end

  # TODO: Decide whether to include screenshot. Auto-email from the company may be sufficient evidence

  def take_screenshot_and_store(job_application_id)
    screenshot_path = Rails.root.join('tmp', "screenshot-#{job_application_id}.png")
    page.save_screenshot(screenshot_path, full: true)

    # Store the screenshot using Active Storage
    file = File.open(screenshot_path)
    job_app = JobApplication.find(job_application_id) # Replace with your actual job_app using the id from the initialize method
    job_app.screenshot.attach(io: file, filename: "screenshot-#{job_application_id}.png", content_type: 'image/png')

    # Clean up temporary screenshot file
    File.delete(screenshot_path)
  end
end
