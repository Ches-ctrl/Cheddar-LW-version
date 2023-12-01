class JobApplicationsController < ApplicationController
  def index
    @job_applications = JobApplication.all.where(user_id: current_user.id)
  end

  def show
  end

  def new
    @job_application = JobApplication.new
    @job = Job.find(params[:job_id])
  end

  def create
    # TODO: only be able to make a job application if you haven't already applied to the job
    # TODO: add failed status to job applications if incomplete - what is the output from the job application page?

    @job_application = JobApplication.new(status: "Pending")
    @job = Job.find(params[:job_id])
    @job_application.job = @job
    @job_application.user = current_user
    if @job_application.save
      if ApplyJob.perform_now(@job_application.id, current_user.id)
        @job_application.update(status: "Applied")
        # flash[:notice] = "You applied to #{Job.find(@job_application.id).job.job_title}!"
        # CHECK IF THIS WORKS
      end
      puts "I'm starting the application job"
      redirect_to job_applications_path, notice: 'Your job application was successful!'
    else
      redirect_to job_path(@job), alert: 'Something went wrong, please try again.'
    end
  end
end
