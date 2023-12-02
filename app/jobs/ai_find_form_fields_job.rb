# require 'nokogiri'
# require 'open-uri'
# require 'net/http'

class AiFindFormFieldsJob < ApplicationJob
  include Capybara::DSL

  # Pass in url to webpage
  # Go to webpage
  # Parse the webpage
  # Take the form tag
  # Pass that to OpenAI via their API
  # Get the response back from OpenAI on form fields
  # Test filling out the form fields
  # If successful, return 'success'
  # If not successful, pass result back to OpenAI to find new form fields
  # If successful, return 'success'
  # If not successful, repeat a maximum of 3 times
  # If still not successful, return 'failure'

  # -------
  # Capybara Attempt
  # -------

  def perform(url)
    # Visit the specified URL
    visit(url)
    find_apply_button.click

    # Wait for the page to load and for the form to appear
    # Adjust the wait time as needed

    p page.html

    form = page.has_css?('form', wait: 10) ? page.find('form') : nil

    # Check if the form is found
    if form.nil?
      puts "Form not found. It might not be present, or it's loaded dynamically."
    else
      puts "Form found."
      p form

      # Convert the form to HTML
      # parsed_html_form = form.native.inner_html
      # p parsed_html_form
    end
  end


  # -------
  # Nokogiri Attempt
  # -------

  # def perform(url)
  #   # Go to webpage and parse
  #   html = URI.open(url).read
  #   p html

  #   parsed_nokogiri = Nokogiri::HTML.parse(html)
  #   p parsed_nokogiri

  #   # Take the form tag (assuming first form in the page)
  #   # form = parsed_nokogiri.at_css('form')
  #   form = parsed_nokogiri.search('form')
  #   p form

  #   if form.nil?
  #     puts "Form not found. HTML might not have it or it's loaded dynamically."
  #   else
  #     puts "Form found."
  #   end

  #   parsed_html_form = form.to_html
  #   p parsed_html_form

  #   return 'failure' unless form

    # Pass form to OpenAI API (pseudo-implementation)
    # form_fields = get_form_fields_from_openai(form.to_s)
    # return 'failure' unless form_fields

    # # Test filling out the form fields (pseudo-implementation)
    # 3.times do
    #   success = test_filling_form(url, form_fields)
    #   return 'success' if success

    #   # Get updated form fields from OpenAI (if not successful)
    #   form_fields = get_form_fields_from_openai(form.to_s, false)
    # end

    # 'failure'
  # end

  private

  def find_apply_button
    find(:xpath, "//a[contains(translate(., 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), 'apply')] | //button[contains(translate(., 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), 'apply')]")
  end

  def get_form_fields_from_openai(form_html, initial_attempt = true)
    # Pseudo-code to send request to OpenAI API
    # You'll need to implement this part based on OpenAI's API documentation
    # and include error handling, API key configuration, etc.
    # Return parsed form fields or nil if unsuccessful
  end

  def test_filling_form(url, form_fields)
    # Implement the logic to fill in the form based on the fields provided by OpenAI
    # Return true if successful, false otherwise
    # This might involve navigating to the form page, inputting data, and submitting
  end
end
