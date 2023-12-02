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

  # def perform(url, fields, job_application_id)
  #   visit(url)
  #   find_apply_button.click

  #   fields.each do |field|
  #     field = field[1]
  #     case field['interaction']
  #     when 'input'
  #       selected_locator = find_available_locator(field["locators"])
  #       p selected_locator
  #       fill_in(selected_locator, with: field['value']) if selected_locator
  #     when 'combobox'
  #       combobox_locator = find_combobox_locator(field["locators"])
  #       option_locator = field['option']
  #       option_text = field['value']
  #       select_option_from_combobox(combobox_locator, option_locator, option_text) if combobox_locator
  #     when 'radiogroup'
  #       radiogroup_locator = find_radiogroup_locator(field["locators"])
  #       option_locator = field['option']
  #       option_text = field['value']
  #       select_option_from_radiogroup(radiogroup_locator, option_locator, option_text) if radiogroup_locator
  #     when 'listbox'
  #       listbox_locator = find_listbox_locator(field["locators"])
  #       select_option_from_listbox(listbox_locator) if listbox_locator
  #     when 'select'
  #       select_locator = find_select_locator(field["locators"])
  #       option_locator = field['option']
  #       option_text = field['value']
  #       select_option_from_select(select_locator, option_locator, option_text) if select_locator
  #     when 'upload'
  #       upload_locator = find_upload_locator(field["locators"])
  #       option_locator = field['value']
  #       upload_file(upload_locator, option_locator) if upload_locator
  #     end
  #   end
  #   # TODO: Return a screenshot of the submitted form
  #   take_screenshot_and_store(job_application_id)
  #   sleep 5
  #   close_session
  # end
