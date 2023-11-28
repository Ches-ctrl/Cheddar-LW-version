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
    @job_application.user = current_user
    @job_application.job = Job.find(params[:job_id])
    if @job_application.save
      redirect_to current_user
    end
  end
end
