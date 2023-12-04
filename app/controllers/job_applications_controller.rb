class JobApplicationsController < ApplicationController
  def index
    @job_applications = JobApplication.all.where(user_id: current_user.id)
  end

  def show
  end

  def new
    # Retrieve the selected job IDs from the session
    @selected_jobs = Job.find(session[:selected_job_ids])

    @job_applications = @selected_jobs.map do |job|
      job_application = JobApplication.new(user: current_user, status: "Pre-application")

      job.application_criteria.each do |field, details|
        application_response = job_application.application_responses.build
        application_response.field_name = field
        application_response.field_locator = details["locators"]
        application_response.interaction = details["interaction"]
        application_response.field_value = current_user.try(field) || ""
        application_response.field_option = details["option"]
      end

      [job, job_application]
    end
    # raise
    # Renders the staging page where the user can review and confirm applications
  end

  # TODO: Split out core application criteria that is common to all job applications
  # TODO: Split out additional application criteria that is specific to the job
  # TODO: only be able to make a job application if you haven't already applied to the job

  def create
    # Retrieve user inputs from the form

    user_input = params[:user_input]

    # Process each selected job
    session[:selected_job_ids].each do |job_id|
      job = Job.find(job_id)

      # update the job/ application criteria

      # Create a job application with the user's input
      @job_application = JobApplication.new(job_application_params)
      @job_application.user = current_user
      @job_application.job = job
      @job_application.status = "Application pending"

      # find out what issue is and if there is one, create or append the validation errors and render new

      if !@job_application.save
        render :new
      end

      # @job_application = JobApplication.new(job: job, user_id: current_user.id, status: "Pre-application")

      # Perform the job application process
      ApplyJob.perform_now(@job_application.id, current_user.id)
      @job_application.update(status: "Applied")

      # Optional: Add a notification for each application
      # flash[:notice] = "You applied to #{Job.find(job_id).job_title}!"
    end

    # Clear the selected job IDs from the session
    session[:selected_job_ids] = nil

    # Redirect to the job applications index page or another appropriate page
    redirect_to job_applications_path, notice: 'Your applications have been submitted.'
  end

  private

  # TODO: Update job_application_params to include the user inputs

  def job_application_params
    params.require(:job_application).permit(:first_name, :last_name, :email, :phone_number, :city, :location_click, :resume, :linkedin_profile, :personal_website, :heard_from, :right_to_work, :require_visa?)
  end
end


# -----------------------------
# Old Create Method with one job application at a time:
# -----------------------------

# def create
#   # TODO: add failed status to job applications if incomplete - what is the output from the job application page?

#   @job_application = JobApplication.new(status: "Pending")
#   @job = Job.find(params[:job_id])
#   @job_application.job = @job
#   @job_application.user = current_user

#   if @job_application.save
#     if ApplyJob.perform_now(@job_application.id, current_user.id)
#       @job_application.update(status: "Applied")
#       # flash[:notice] = "You applied to #{Job.find(@job_application.id).job.job_title}!"
#       # CHECK IF THIS WORKS
#     end
#     puts "I'm starting the application job"
#     redirect_to job_applications_path, notice: 'Your job application was successful!'
#   else
#     redirect_to job_path(@job), alert: 'Something went wrong, please try again.'
#   end
# end

# -----------------------------
# Old New Method that partially worked
# -----------------------------


# def new
#   # Retrieve the selected job IDs from the session
#   @selected_jobs = Job.find(session[:selected_job_ids])

#   @job_application = JobApplication.new
#   @job_application.user = current_user
#   @job_application.status = "Pre-application"

#   # TODO: Fill application response based on the job application criteria, which is listed as a JSON in the field application_criteria on the job model
#   # TODO: Pull the user input values from the user model
#   # TODO: Add the user input values to the application response

#   @selected_jobs.each do |job|
#     application_response = ApplicationResponse.new
#     job.application_criteria.each do |field, type|
#       application_response[field] = current_user.send(field)
#     end
#     job.application_response = application_response
#   end

#   # We have the selected jobs, we want to render a separate form for each job
#   # Renders the staging page where the user can review and confirm applications
# end


# -----------------------------
# Core Application Criteria:
# -----------------------------

CoreApplicationCriteria = {
  first_name: {
    interaction: :input,
  },
  last_name: {
    interaction: :input,
  },
  email: {
    interaction: :input,
  },
  phone_number: {
    interaction: :input,
  },
  city: {
    interaction: :input,
  },
  location_click: {
    interaction: :listbox,
  },
  resume: {
    interaction: :upload,
  },
  linkedin_profile: {
    interaction: :input,
  },
  personal_website: {
    interaction: :input,
  },
  heard_from: {
    interaction: :input,
  },
  right_to_work: {
    interaction: :select,
  },
  require_visa?: {
    interaction: :select,
  }
}
