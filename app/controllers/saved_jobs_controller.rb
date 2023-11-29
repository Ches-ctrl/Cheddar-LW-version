class SavedJobsController < ApplicationController
  def index
    @saved_jobs = SavedJob.all.where(user_id: current_user.id)
  end

  def new
    @saved_job = SavedJob.new
    @job = Job.find(params[:job_id])
  end

  def create
    @saved_job = SavedJob.new
    @job = Job.find(params[:job_id])
    @saved_job.job = @job
    @saved_job.user = current_user
    if @saved_job.save
      redirect_to saved_jobs_path, notice: 'Succesfully added to your saved jobs!'
    else
      redirect_to job_path(@job), alert: 'Something went wrong, please try again.'
    end
  end
end
