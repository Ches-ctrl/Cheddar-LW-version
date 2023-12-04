class FormFiller
  include Capybara::DSL

  # TODO: Review code for inefficient loops and potential optimisations
  # TODO: Add ruby monitoring tools to monitor performance and execution
  # TODO: Implement caching for both user and form inputs. At the moment we request the database every time we want an input
  # TODO: Cache values at beginning of session and then update cache when user changes values
  # TODO: Enable multi-job application support in form_filler and cache before all applications are submitted
  # TODO: Restrict search to certain portions of the page

  # Could we implement caching for form inputs? So once you've done it once it becomes less intensive

  def fill_out_form(url, fields, job_application_id)
    visit(url)
    find_apply_button.click rescue nil

    fields.each do |field|
      field = field[1]
      case field['interaction']
      when 'input'
        begin
          fill_in(field['locators'], with: field['value'])
        rescue Capybara::ElementNotFound
          p "Field locator #{field['locators']} is not found"
          find(field['locators']).set(field['value']) rescue nil
        end
      when 'combobox'
        begin
          select_option_from_combobox(field['locators'], field['option'], field['value'])
        rescue Capybara::ElementNotFound
          p "Field locator #{field['locators']} is not found"
        end
      when 'radiogroup'
        begin
          select_option_from_radiogroup(field['locators'], field['option'], field['value'])
        rescue Capybara::ElementNotFound
          p "Field locator #{field['locators']} is not found"
        end
      when 'listbox'
        begin
          select_option_from_listbox(field['locators'])
        rescue NoMethodError
          p "Field locator #{field['locators']} is not found"
        end
      when 'select'
        begin
          select_option_from_select(field['locators'], field['option'], field['value'])
        rescue Capybara::ElementNotFound
          p "Field locator #{field['locators']} is not found"
        end
      when 'upload'
        begin
          upload_file(field['locators'], field['value'])
        rescue Capybara::ElementNotFound
          p "Field locator #{field['locators']} is not found"
        end
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
  # TODO: Check whether new screenshot method works

  # ------------
  # New method for taking screenshots - saves screenshot in memory rather than to disk
  # ------------

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


  # ------------
  # New method for taking screenshots - saves screenshot in memory rather than to disk
  # ------------

  # def take_screenshot_and_store(job_application_id)
  #   # Capture screenshot directly into memory
  #   screenshot = StringIO.new(page.screenshot(full: true))

  #   # Find the job application record
  #   job_app = JobApplication.find(job_application_id) # Replace with your actual job_app using the id from the initialize method

  #   # Attach the screenshot directly from memory
  #   job_app.screenshot.attach(io: screenshot, filename: "screenshot-#{job_application_id}.png", content_type: 'image/png')

  #   # No need to clean up temporary files since we didn't create any
  # end
end
