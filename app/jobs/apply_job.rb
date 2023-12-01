class ApplyJob < ApplicationJob
  queue_as :default

  # TODO: Separate application criteria into separate DB table that is then called and we search through dynamically
  # TODO: Add a callback option so that the user inputs all the information required for the job before submitting
  # TODO: Notify the user of the application steps so that they're kept in the loop

  def perform(job_application_id, user_id)
    job = JobApplication.find(job_application_id).job
    user = User.find(user_id)

    # p "Starting the job application..."
    # p "Job details: #{JobApplication.find(job_application_id).job.job_title}}"
    # p "User details: #{User.find(user_id).first_name}"

    # p "Finding URL for job application..."
    # p "Assigning values to fill in the form..."

    # TODO: check application criteria, query user based on application criteria, fill in form with user details
    # TODO: send method in ruby to get user values

    # Filling in form with user details
    application_criteria = assign_values_to_form(job, user)

    # Reassigning application criteria to fields_to_fill
    fields_to_fill = application_criteria

    # p "Initializing FormFiller..."
    form_filler = FormFiller.new

    # Going to URL and filling out form
    form_filler.fill_out_form(job.job_posting_url, fields_to_fill)

    # Ending Capbybara session
    Capybara.send(:session_pool).each { |name, ses| ses.driver.quit }

    sleep 3
    p "You applied to #{job.job_title}!"
  end

  private

  def assign_values_to_form(job, user)
    p "Assigning values to form in assign_values_to_form method..."
    application_criteria = job.application_criteria
    p "Application criteria without values: #{application_criteria}"

    application_criteria.each do |key, value|
      if user.respond_to?(key) && user.send(key).present?
        # Update the hash with the user's value for this attribute
        p "Using USER value for #{key}"
        application_criteria[key]['value'] = user.send(key)
      elsif Defaults.key?(key) && Defaults[key].key?('value')
        p "Warning: User does not have a method or attribute '#{key}'"
        p "Using DEFAULT value instead"
        application_criteria[key]['value'] = Defaults.dig(key, 'value')
      else
        p "Warning: Defaults does not have a method or attribute '#{key}'"
        p "Using NIL value instead"
        application_criteria[key]['value'] = nil
      end
    end
    p "Application criteria with values: #{application_criteria}"
    return application_criteria
  end
end

# Phone
# Right to work
# Preferred Pronouns
# TODO: Default value of Prefer Not To Say

Defaults = {
  'first_name' => {
    'value' => "Chuck"
  },
  'last_name' => {
    'value' => "Norris"
  },
  'email' => {
    'value' => "email1@gmail.com"
  },
  'phone_number' => {
    'value' => "+447874943544"
  },
  'cv_upload' => {
    'value' => '/Users/charliecheesman/code/Ches-ctrl/Cheddar/public/Obretetskiy_cv.pdf'
  },
  'salary_expectation_text' => {
    'value' => "£30,000 - £40,000"
  },
  'right_to_work' => {
    'value' => /yes/i ## TODO
  },
  'salary_expectation_figure' => {
    'value' => 30000
  },
  'notice_period' => {
    'value' => 12
  },
  'preferred_pronoun_value' => {
    'value' => /he\/him/i ## TODO
  },
  'preferred_pronoun_text' => {
    'value' => 'N/A' ## TODO
  },
  'employee_referral' => {
    'value' => "no"
  }
}

# first_name: {
#   interaction: :input,
#   locators: ['firstname']
# },
# last_name: {
#   interaction: :input,
#   locators: ['lastname']
# },
# email: {
#   interaction: :input,
#   locators: ['email']
# },
# phone_number: {
#   interaction: :input,
#   locators: ['phone']
# },
# cv_upload: {
#   interaction: :upload,
#   locators: ['input#input_files_input_3965534823623269']
# },
# salary_expectation_text: {
#   interaction: :input,
#   locators: ['CA_18698']
# },
# right_to_work: {
#   interaction: :input,
#   locators: ['fieldset[data-ui="QA_6308627"]']
# },
# salary_expectation_figure: {
#   interaction: :input,
#   locators: ['QA_6308628']
# },
# notice_period: {
#   interaction: :input,
#   locators: ['QA_6308629']
# },
# preferred_pronoun_select: {
#   interaction: :input,
#   locators: XXX
# },
# preferred_pronoun_text: {
#   interaction: :input,
#   locators: ['QA_6308631']
# },
# employee_referral: {
#   interaction: :input,
#   locators: ['QA_6427777']
# }
