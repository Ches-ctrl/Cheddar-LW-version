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
      Capybara.default_driver = :selenium
      Capybara.javascript_driver = :selenium
    end
  end

  # TODO: Move to application jobs controller when complete. This will run as a background job.

  def fill_out_form(url, fields)
    visit(url)
    find_apply_button.click
    p url
    p fields
    p "started filling form at #{Time.zone.now}"

    fields.each do |field|
      # case field[:interaction]
      # when :input
      p field
      p field[1]
      p field[1]["locators"]
      selected_locator = find_available_locator(field[1]["locators"])
      p selected_locator
      fill_in(selected_locator, with: field[1]['value']) if selected_locator
      # when :click
      #   selected_locator = find_available_locator(field[:locators])
      #   p selected_locator
      #   click_on(selected_locator) if selected_locator
      # when :combobox
      #   combobox_locator = find_available_locator(field[:locators])
      #   option_locator = field['value']
      #   p combobox_locator
      #   p option_locator
      #   select_option_from_combobox(combobox_locator, option_locator)
      # end

      sleep 5
    end
    p "finished filling form at #{Time.zone.now}"
  end

  private

  def find_apply_button
    find(:xpath, "//a[contains(translate(., 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), 'apply')] | //button[contains(translate(., 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), 'apply')]")
  end

  def find_available_locator(locators)
    # p page
    # p page.body
    p "started finding availablelocator at #{Time.zone.now}"
    locators.each do |locator|
      p locator
      begin
        matching_input = page.find_field(locator)
        p matching_input.class
        p matching_input
        return locator unless matching_input.nil?
        p "found availablelocator at #{Time.zone.now}"
      rescue Capybara::ElementNotFound
      end
    end
    nil
  end

  def select_option_from_combobox(combobox_locator, option_locator)
    find(combobox_locator).click
    within(combobox_locator) do
      find(option_locator, text: /he\/him/i).click
    end
  end
end

# fields_to_fill = [
#   { interaction: :input, locators: ['firstname', 'first_name'], value: 'Ilya' },
#   { interaction: :input, locators: ['lastname', 'last_name'], value: 'Obretetskiy' },
#   { interaction: :input, locators: ['email'], value: 'obreil54@gmail.com' },
#   { interaction: :input, locators: ['phone'], value: '+447564055308' },
#   { interaction: :input, locators: ['CA_18698'], value: '£30,000' },
#   { interaction: :input, locators: ['QA_6308628'], value: '£30,000' },
#   { interaction: :input, locators: ['QA_6308629'], value: '3' },
#   { interaction: :input, locators: ['QA_6308631'], value: 'N/A' },
#   { interaction: :input, locators: ['QA_6427777'], value: 'no' },
#   { interaction: :input, locators: ['job_application[location]'], value: 'London' },
#   { interaction: :input, locators: ['job_application_answers_attributes_0_text_value'], value: 'https://www.linkedin.com/in/ilya-obretetskiy-b5010b1b5/' },
#   { interaction: :input, locators: ['job_application_answers_attributes_1_text_value'], value: 'https://www.ilya.com' },
#   { interaction: :input, locators: ['job_application_answers_attributes_2_text_value'], value: 'Cheddar' },
# ]

#   { interaction: :combobox, locators: ['input[role="combobox"]'], value: 'li span', text: /he\/him/i }
# form_filler = FormFiller.new

# form_filler.fill_out_form('https://apply.workable.com/kroo/j/C51C29B6C0/', fields_to_fill)
# form_filler.fill_out_form('https://boards.greenhouse.io/deliveroo/jobs/5447359?utm_source=trueup&utm_medium=website&ref=trueup#app', fields_to_fill)
# form_filler.fill_out_form('https://boards.greenhouse.io/bcgdv/jobs/6879714002?gh_jid=6879714002&utm_source=trueup&utm_medium=website&ref=trueup', fields_to_fill)

# def fill_out_form(url, fields)
#   fill_in('firstname', with: 'Ilya')
#   fill_in('lastname', with: 'Obretetskiy')
#   fill_in('email', with: 'obreil54@gmail.com')
#   # fill_in('address', with: '8 Hawksmoor Mews, London, E1 0DG')
#   fill_in('phone', with: '+447564055308')
#   fill_in('CA_18698', with: "£30,000")
#   # within(:fieldset, class: 'styles--2-TzV styles--3u2Bk') do
#   #   find('div[role="radio"]', text: 'yes').click
#   # end
#   fill_in('QA_6308628', with: "£30,000")
#   fill_in('QA_6308629', with: "3")
#   find('input [role='combobox]').click
#   #Add an if else statement here in case the user's pronouns aren't avialbale and list them in the fill_in section
#   all('li span', text: /he\/him/i, visible: true)[0].click
#   fill_in('QA_6308631', with: "N/A")
#   fill_in('QA_6427777', with: "no")
#   # click_button "Sign up"
# end
