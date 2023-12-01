require 'capybara/rails'
require 'capybara/dsl'

class FormFiller
  include Capybara::DSL

  # TODO: Move to config intializers

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

  def fill_out_form(url, fields)
    visit(url)
    find_apply_button.click

    fields.each do |field|
      field = field[1]
      case field['interaction']
      when 'input'
        selected_locator = find_available_locator(field["locators"])
        p selected_locator
        fill_in(selected_locator, with: field['value']) if selected_locator
      when 'combobox'
        combobox_locator = find_combobox_locator(field["locators"])
        option_locator = field['option']
        option_text = field['value']
        select_option_from_combobox(combobox_locator, option_locator, option_text) if combobox_locator
      when 'radiogroup'
        radiogroup_locator = find_radiogroup_locator(field["locators"])
        option_locator = field['option']
        option_text = field['value']
        select_option_from_radiogroup(radiogroup_locator, option_locator, option_text) if radiogroup_locator
      when 'listbox'
        listbox_locator = find_listbox_locator(field["locators"])
        select_option_from_listbox(listbox_locator) if listbox_locator
      when 'select'
        select_locator = find_select_locator(field["locators"])
        option_locator = field['option']
        option_text = field['value']
        select_option_from_select(select_locator, option_locator, option_text) if select_locator
      when 'upload'
        upload_locator = find_upload_locator(field["locators"])
        option_locator = field['value']
        upload_file(upload_locator, option_locator) if upload_locator
      end
    end
    # TODO: Return a screenshot of the submitted form
    sleep 3
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
end
