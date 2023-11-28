require 'capybara/rails'
require 'capybara/dsl'

class FormFiller
  include Capybara::DSL


  def initialize
    Capybara.run_server = false

    Capybara.register_driver :selenium do |app|
      if Rails.env.production?
        chrome_bin = ENV.fetch('GOOGLE_CHROME_SHIM', nil)
        p chrome_bin
        chrome_opts = chrome_bin ? { "binary" => chrome_bin } : {}
        p chrome_opts
        Selenium::WebDriver::Chrome.path = chrome_bin
        Capybara::Selenium::Driver.new(
          app,
          browser: :chrome,
          options: Selenium::WebDriver::Options.chrome
          )
      else
        options = Selenium::WebDriver::Chrome::Options.new
        # options.add_argument("--headless")
        options.add_argument("--no-sandbox")
        options.add_argument("--window-size=1400,1000")
        # options.add_argument("--disable-gpu")
        options.add_argument("--disable-dev-shm-usage")
        options.add_argument("--remote-debugging-port=9225")
        Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
      end
    end
    Capybara.javascript_driver = :selenium

    Capybara.default_driver = :selenium
  end

  def fill_out_form
    puts "Before Page"
    visit("https://apply.workable.com/benevolentai/j/28334DF927/apply/")
    # fill_in(‘Username’, with: ‘your_username’)
    puts "After Page"
    puts page.html
    fill_in('firstname', with: 'Ilya')
    fill_in('lastname', with: 'Obretetskiy')
    click_button "Submit application"
  end
end

# url = "https://apply.workable.com/benevolentai/j/28334DF927/apply/"
# form_data = {
#   'firstname' => 'Ilya',
#   # Add other form fields as needed
# }

# FormFiller.new.fill_out_form(url, form_data)
