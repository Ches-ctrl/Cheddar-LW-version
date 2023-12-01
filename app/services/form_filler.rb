require 'capybara/rails'
require 'capybara/dsl'

class FormFiller
  include Capybara::DSL

  # TODO: Move to config intializers

  def initialize#(url, fields)
    # fields =
      # { interaction: :input, locators: ['firstname', 'first_name'], value: 'Ilya' }, DONE
      # { interaction: :input, locators: ['lastname', 'last_name'], value: 'Obretetskiy' },DONE
      # { interaction: :input, locators: ['email'], value: 'obreil54@gmail.com' },DONE
      # { interaction: :input, locators: ['phone'], value: '+447564055308' },DONE
      # { interaction: :input, locators: ['CA_18698'], value: '£30,000' },DONE
      # { interaction: :input, locators: ['QA_6308628'], value: '£30,000' },DONE
      # { interaction: :input, locators: ['QA_6308629'], value: '3' },DONE
      # { interaction: :input, locators: ['QA_6308631'], value: 'N/A' },DONE
      # { interaction: :input, locators: ['QA_6427777'], value: 'no' },DONE
      # { interaction: :input, locators: ['job_application[location]'], value: 'London' },DONE
      # { interaction: :listbox, locators: ['ul#location_autocomplete-items-popup'] },
      # { interaction: :input, locators: ['job_application_answers_attributes_0_text_value'], value: 'https://www.linkedin.com/in/ilya-obretetskiy-b5010b1b5/' },
      # { interaction: :input, locators: ['job_application_answers_attributes_1_text_value'], value: 'https://www.ilya.com' },
      # { interaction: :input, locators: ['job_application_answers_attributes_2_text_value'], value: 'Cheddar' },
      # { interaction: :combobox, locators: ['input#input_QA_6308630_input'], value: 'li', text: /he\/him/i },
      # { interaction: :radiogroup, locators: ['fieldset[data-ui="QA_6308627"]'], value: 'label', text: /yes/i },
      # { interaction: :select, locators: ['select#job_application_answers_attributes_1_boolean_value', 'select#job_application_answers_attributes_3_boolean_value'], value: 'option', text: /yes/i},
      # { interaction: :select, locators: ['select#job_application_answers_attributes_2_boolean_value'], value: 'option', text: /yes/i},
      # { interaction: :select, locators: ['select#job_application_answers_attributes_4_boolean_value'], value: 'option', text: /no/i},

      #1. Pass in cloudinary url file we want to upload
      #2. Open URL to download it
      #3. Save to temp folder
      #4. Pass that file as argument

    #   { interaction: :upload, locators: ['input[type="file"]', 'button[aria-describedby="resume-allowable-file-types"'], value: "/home/ilya/code/obreil54/Cheddar/Cheddar/public/Obretetskiy_cv.pdf"}
    # ]

    # @url = 'https://apply.workable.com/kroo/j/C51C29B6C0/' #url
    # @url = 'https://boards.greenhouse.io/deliveroo/jobs/5447359?utm_source=trueup&utm_medium=website&ref=trueup#app' #url
    # @url = 'https://boards.greenhouse.io/bcgdv/jobs/6879714002?gh_jid=6879714002&utm_source=trueup&utm_medium=website&ref=trueup' #url
    # @fields = fields


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

#   # TODO: Move to application jobs controller when complete. This will run as a background job.

#   def fill_out_form(url, fields)
#     visit(url)
#     find_apply_button.click
#     p url
#     p fields
#     p "started filling form at #{Time.zone.now}"

#     fields.each do |field|
#       # case field[:interaction]
#       # when :input
#       p field
#       p field[1]
#       p field[1]["locators"]
#       selected_locator = find_available_locator(field[1]["locators"])
#       p selected_locator
#       fill_in(selected_locator, with: field[1]['value']) if selected_locator
#       # when :click
#       #   selected_locator = find_available_locator(field[:locators])
#       #   p selected_locator
#       #   click_on(selected_locator) if selected_locator
#       # when :combobox
#       #   combobox_locator = find_available_locator(field[:locators])
#       #   option_locator = field['value']
#       #   p combobox_locator
#       #   p option_locator
#       #   select_option_from_combobox(combobox_locator, option_locator)
#       # end

#       sleep 5

  def fill_out_form
    visit(@url)
    find_apply_button.click

    @fields.each do |field|
      case field[:interaction]
      when :input
        selected_locator = find_available_locator(field[1]["locators"])
        p selected_locator
        fill_in(selected_locator, with: field[:value]) if selected_locator
      when :combobox
        combobox_locator = find_combobox_locator(field[1]["locators"])
        option_locator = field[:value]
        option_text = field[:text]
        select_option_from_combobox(combobox_locator, option_locator, option_text) if combobox_locator
      when :radiogroup
        radiogroup_locator = find_radiogroup_locator(field[1]["locators"])
        option_locator = field[:value]
        option_text = field[:text]
        select_option_from_radiogroup(radiogroup_locator, option_locator, option_text) if radiogroup_locator
      when :listbox
        listbox_locator = find_listbox_locator(field[1]["locators"])
        p listbox_locator
        select_option_from_listbox(listbox_locator) if listbox_locator
      when :select
        select_locator = find_select_locator(field[1]["locators"])
        option_locator = field[:value]
        option_text = field[:text]
        select_option_from_select(select_locator, option_locator, option_text) if select_locator
      when :upload
        upload_locator = find_upload_locator(field[1]["locators"])
        option_locator = field[:value]
        upload_file(upload_locator, option_locator) if upload_locator
      end
    end
    # TODO: Return a screenshot of the submitted form
    take_screenshot_and_store
    sleep 10
    close_session
  end

  private

  def close_session
    Capybara.send(:session_pool).each { |name, ses| ses.driver.quit }

  end
  def find_apply_button
    find(:xpath, "//a[contains(translate(., 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), 'apply')] | //button[contains(translate(., 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), 'apply')]")
  end

  def find_available_locator(locators)
    locators.each do |locator|
      begin
        matching_input = page.find_field(locator)
        return locator unless matching_input.nil?
      rescue Capybara::ElementNotFound
        p 'error finding locator'
      end
    end
    nil
  end

  def find_combobox_locator(locators)
    p 'finding cmbobox locator'
    locators.each do |locator|
      begin
        matching_input = page.find(locator)
        return locator unless matching_input.nil?
      rescue Capybara::ElementNotFound
        p 'error finding locator'
      end
    end
    nil
  end

  def select_option_from_combobox(combobox_locator, option_locator, option_text)
    find(combobox_locator).click
    all(option_locator, text: option_text, visible: true)[0].click
  end

  def find_radiogroup_locator(locators)
    locators.each do |locator|
      begin
        p "looking for radiogroup locator"
        matching_input = page.find(locator)
        p 'found radiogroup locator'
        return locator unless matching_input.nil?
      rescue Capybara::ElementNotFound
        p 'error finding locator'
      end
    end
    nil
  end

  def select_option_from_radiogroup(radiogroup_locator, option_locator, option_text)
    within(radiogroup_locator) do
      find(option_locator, text: option_text).click
    end
  end

  def find_listbox_locator(locators)
    locators.each do |locator|
      begin
        p "looking for listbox"
        matching_input = page.find(locator)
        p "found match"
        p matching_input
        return locator unless matching_input.nil?
      rescue Capybara::ElementNotFound
        p 'error finding locator'
      end
    end
    nil
  end

  def select_option_from_listbox(listbox_locator)
    all("#{listbox_locator} li")[0].click
  end

  def find_select_locator(locators)
    locators.each do |locator|
      p locator
      begin
        matching_input = page.find(locator)
        return locator unless matching_input.nil?
      rescue Capybara::ElementNotFound
        p 'error finding locator'
      end
    end
    nil
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

  def find_upload_locator(locators)
    locators.each do |locator|
      p locator
      begin
        matching_input = page.find(locator)
        return locator unless matching_input.nil?
      rescue Capybara::ElementNotFound
        p 'error finding upload locator'
      end
    end
    nil
  end

  def upload_file(upload_locator, option_locator)
    begin
      find(upload_locator).attach_file(option_locator)
    rescue Capybara::ElementNotFound
      page.attach_file(option_locator) do
        page.find(upload_locator).click
      end
    end
  end

  def take_screenshot_and_store
    screenshot_path = Rails.root.join('tmp', 'screenshot.png')
    page.save_screenshot(screenshot_path)

    # Store the screenshot using Active Storage
    file = File.open(screenshot_path)
    user = JobApplication.first # Replace with your actual user
    user.screenshot.attach(io: file, filename: 'screenshot.png', content_type: 'image/png')

    # Clean up temporary screenshot file
    File.delete(screenshot_path)
  end
end
