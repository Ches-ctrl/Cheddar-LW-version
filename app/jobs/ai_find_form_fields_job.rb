class AiFindFormFieldsJob < ApplicationJob
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

  queue_as :default

  def perform(*args)
    # Do something later
  end

  def fill_out_form(url, fields, job_application_id)
    visit(url)
    find_apply_button.click

    fields.each do |field|
      field = field[1]
      case field['interaction']
      when 'input'
        selected_locator = find_available_locator(field["locators"])
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
    # Return a screenshot of the submitted form
    take_screenshot_and_store(job_application_id)
    close_session
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


end
