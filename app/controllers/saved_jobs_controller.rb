class SavedJobsController < ApplicationController
  def index
    @saved_jobs = SavedJob.all.where(user_id: current_user.id)
  end

  def new
    @saved_job = SavedJob.new
    @job = Job.find(params[:job_id])
  end

  def create
    @saved_job = SavedJob.new()
    @saved_job.user = current_user
    @job = Job.find(params[:job_id])
    @saved_job.job = @job
    if @saved_job.save
      redirect_to saved_jobs_path, notice: 'Job successfully saved!'
    else
      redirect_to job_path(@job), alert: 'Something went wrong, please try again'
    end
  end

  def destroy
    @saved_job = SavedJob.find(params[:id])
    if @saved_job.destroy
      redirect_to saved_jobs_path, notice: 'Successfully removed from your saved jobs'
    else
      render saved_jobs_path, status: :unprocessable_entity
    end
  end
end
