require 'capybara/rails'
# require 'capybara/dsl'

class FormFiller
  # include Capybara::DSL

  def initialize
    Capybara.run_server = false
    Capybara.register_driver :headless_chrome do |app|
      options = Selenium::WebDriver::Chrome::Options.new
      # options.add_argument("--headless")
      options.add_argument("--no-sandbox")
      options.add_argument("--window-size=1400,1000")
      options.add_argument("--disable-gpu")
      options.add_argument("--disable-dev-shm-usage")
      options.add_argument("--remote-debugging-port=9225")
      Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
    end
  end

  def fill_out_form
    session = Capybara::Session.new(:headless_chrome)
    puts "Before Page"
    p session
    p session.methods.sort
    session.visit('https://www.example.com')
    # session.fill_in(‘Username’, with: ‘your_username’)
    # session.visit("https://apply.workable.com/benevolentai/j/28334DF927/apply/")
    puts "After Page"
    puts page.html
    session.fill_in('firstname', with: 'Ilya')
    session.click_button "Submit application"
  end
end

# url = "https://apply.workable.com/benevolentai/j/28334DF927/apply/"
# form_data = {
#   'firstname' => 'Ilya',
#   # Add other form fields as needed
# }

# FormFiller.new.fill_out_form(url, form_data)
