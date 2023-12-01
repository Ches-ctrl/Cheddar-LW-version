class JobsController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:query].present?
      @results = PgSearch.multisearch(params[:query])
    else
      @jobs = Job.all
    end
    @job = Job.new
    @saved_job = SavedJob.new
  end

  def show
    @job = Job.find(params[:id])
    @saved_job = SavedJob.new
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to job_path(@job), notice: 'Job was successfully added'
    else
      @jobs = Job.all
      render 'jobs/index', status: :unprocessable_entity
    end
  end

  def apply_to_selected_jobs
    selected_job_ids = params[:job_ids]
    selected_job_ids.each do |job_id|
      job_app = JobApplication.create(job_id: job_id, user_id: current_user.id, status: "Pre-application")
      ApplyJob.perform_now(job_app.id, current_user.id)
      # flash[:notice] = "You applied to #{Job.find(job_id).job_title}!"
    end
    redirect_to job_applications_path
  end

  private

  def job_params
    params.require(:job).permit(:job_title, :job_description, :salary, :job_posting_url, :application_deadline, :date_created, :company_id)
  end
end
