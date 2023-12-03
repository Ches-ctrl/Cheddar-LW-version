require 'nokogiri'
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
    visit(url)
    find_apply_button.click

    # page_html = page.html
    form = find('form')

    # Extract form HTML from Capybara element
    form_html = page.evaluate_script("arguments[0].outerHTML", form.native)

    # Alternative way of getting form HTML:
    # form_html = page.evaluate_script("document.querySelector('form').outerHTML")
    # p "Other form: #{form_html}"

    # Convert Capybara element to a Nokogiri element
    nokogiri_form = Nokogiri::HTML.fragment(form_html)

    # ---------------
    # Prior to this doesn't need to be touched
    # ---------------

    # ---------------
    # OpenAI Attempt III
    # ---------------

    # form_elements = []

    # nokogiri_form.css('input, select, textarea, label').each do |element|
    #   case element.name
    #   when 'label'
    #     # Find the associated input/select/textarea element
    #     input_id = element['for']
    #     input_element = nokogiri_form.at_css("[id='#{input_id}']")

    #     if input_element
    #       form_elements << {
    #         label: element.text.strip,
    #         type: input_element.name, # 'input', 'select', or 'textarea'
    #         id: input_element['id'],
    #         name: input_element['name'],
    #         input_type: input_element['type'], # for 'input' elements, e.g., 'text', 'checkbox'
    #         required: input_element['required'],
    #         value: input_element['value']
    #       }
    #     end
    #   end
    # end

    # # Output the extracted elements
    # puts "Form Elements:"
    # form_elements.each { |element| p element }

    # ---------------
    # OpenAI Attempt II - works
    # ---------------

    user_inputs = nokogiri_form.css('input, select, textarea').map do |element|
      {
        type: element.name, # 'input', 'select', or 'textarea'
        id: element['id'],
        name: element['name'],
        input_type: element['type'], # for 'input' elements, e.g., 'text', 'checkbox'
        required: element['required'],
        value: element['value']
      }
    end

    # Extract labels and associate them with inputs
    labels = nokogiri_form.css('label').map do |label|
      input_id = label['for']
      input_element = user_inputs.find { |input| input[:id] == input_id }

      {
        label_text: label.text.strip,
        associated_input: input_element
      }
    end

    # Output the extracted elements
    puts "User Inputs:"
    user_inputs.each { |input| p input }

    puts "Labels with Associated Inputs:"
    labels.each { |label| p label }


    # ---------------
    # OpenAI Attempt I - ? status
    # ---------------

    # required_elements = nokogiri_form.css('label, input, select, textarea').each_with_object([]) do |element, arr|
    #   if element.name == 'label'
    #     # Extract label text and corresponding input details
    #     input_id = element['for']
    #     input_element = nokogiri_form.at_css("##{input_id}")

    #     if input_element
    #       arr << {
    #         label: element.text.strip,
    #         input_id: input_id,
    #         input_name: input_element['name'],
    #         input_type: input_element['type'],
    #         required: input_element['required']
    #       }
    #     end
    #   end
    # end

    # required_elements.each { |element| p element }

    # ---------------
    # Old Working Method but that is too long for OpenAI

    # # Remove style attributes from all elements
    # nokogiri_form.traverse { |node| node.delete('style') }

    # # Get the HTML content of the form element without style properties
    # # cleaned_html = nokogiri_form.to_html

    # # puts "Cleaned HTML:"
    # # puts cleaned_html

    # simplified_form = Nokogiri::HTML::DocumentFragment.parse("")

    # nokogiri_form.css('input, select, textarea, label').each do |element|
    #   # Clone the element to modify it
    #   cloned_element = element.clone

    #   # Remove all attributes except the essentials
    #   cloned_element.attributes.each do |name, _|
    #     unless ['id', 'name', 'type', 'aria-labelledby', 'for', 'value'].include?(name)
    #       cloned_element.remove_attribute(name)
    #     end
    #   end

    #   # Add to simplified form
    #   simplified_form.add_child(cloned_element)
    # end

    # # puts "Simplified form:"
    # # puts simplified_form

    # simplified_html = simplified_form.to_html

    # puts "Simplified HTML:"
    # puts simplified_html

    # puts "Length: #{cleaned_html.size} characters"
    # puts "Length: #{simplified_html.size} characters"
    # puts "Tokens required: #{OpenAI.rough_token_count(simplified_html)}"

    p "(1) Sending cleaned HTML to OpenAI..."

    # TODO: Install TikToken gem to check for number of tokens in message
    # TODO: OR call OpenAI API directly to check for number of tokens in message
    # TODO: Batch processing if number of tokens exceeds limit

    # OpenAI HTTP Error (spotted in ruby-openai 6.3.0): {"error"=>{"message"=>"This model's maximum context length is 16385 tokens. However, your messages resulted in 30810 tokens. Please reduce the length of the messages.", "type"=>"invalid_request_error", "param"=>"messages", "code"=>"context_length_exceeded"}}

    ai_response = GetAiResponseJob.perform_now(user_inputs, labels)
    application_criteria_string = ai_response["choices"][0]["message"]["content"]
    application_criteria = JSON.parse(application_criteria_string)

    puts application_criteria
    puts application_criteria["application_criteria"]
    # puts application_criteria.dig["application_criteria"]

    Job.create(
      job_title: "Software Engineer-Full stack (Junior Level)",
      job_description: "Kroo has a big vision. To be the first bank that is both trusted and loved by its customers.We’re helping people take control of their financial future and achieve their goals, whilst making a positive impact on the planet. Here at Kroo, doing what is right is in our DNA. We act with integrity, transparency and honesty. We think big, dream big, and relentlessly pursue our goals. We like to be bold, break new ground, and we never stop learning. But most importantly, we are on this journey together.",
      salary: 30000,
      date_created: Date.today,
      application_criteria: application_criteria["application_criteria"],
      application_deadline: Date.today + 30,
      job_posting_url: "https://apply.workable.com/kroo/j/C51C29B6C0",
      company_id: Company.first.id)

    JobApplication.create(
      status: "Pre-test",
      user_id: User.first.id,
      job_id: Job.last.id
    )
    puts "Created job application for #{User.first.first_name} for #{Job.first.job_title}"

    ApplyJob.perform_now(JobApplication.last.id, User.first.id)
  end

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
