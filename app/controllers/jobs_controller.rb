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

  private

  def job_params
    params.require(:job).permit(:job_title, :job_description, :salary, :job_posting_url, :application_deadline, :date_created, :company_id)
  end
end
