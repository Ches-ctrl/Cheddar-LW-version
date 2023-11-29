class JobApplicationsController < ApplicationController
  def index
    @job_applications = JobApplication.all
  end

  def show

  end

  def new
    @job_application = JobApplication.new
    @job = Job.find(params[:job_id])
  end

  def create
    @job_application = JobApplication.new(status: "Applied")
    @job = Job.find(params[:job_id])
    @job_application.job = @job
    @job_application.user = current_user
    if @job_application.save
      redirect_to job_path(@job), notice: 'Your job application was successful!'
    else
      redirect_to job_path(@job), alert: 'Something went wrong, please try again.'
    end
  end
end
