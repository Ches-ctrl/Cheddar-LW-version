require 'capybara/rails'
require 'capybara/dsl'

class FormFiller
  include Capybara::DSL


  def initialize
    Capybara.run_server = false

    if Rails.env.production?
      Capybara.register_driver :selenium do |app|
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

  def fill_out_form
    puts "Before Page"
    # visit("https://apply.workable.com/benevolentai/j/28334DF927/apply/")
    visit("https://schematiqs.herokuapp.com/users/sign_up")
    # fill_in(‘Username’, with: ‘your_username’)
    puts "After Page"
    puts page.html
    fill_in('user[email]', with: 'test1@userabdbufdu.com')
    fill_in('user[password]', with: 'password')
    fill_in('user[password_confirmation]', with: 'password')
    click_button "Sign up"
  end
end

# url = "https://apply.workable.com/benevolentai/j/28334DF927/apply/"
# form_data = {
#   'firstname' => 'Ilya',
#   # Add other form fields as needed
# }

# FormFiller.new.fill_out_form(url, form_data)
