class JobsController < ApplicationController
  before_action :authenticate_user!

  def index
    @jobs = Job.all
    @job = Job.new
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    # job.company = Company.find(params[:company_id])
    if @job.save
      redirect_to job_path(job)
    end
    # if job.save
    #   redirect_to company_path(job.company)
    # else
    #   render :new
    # end
  end

  private

  def job_params
    params.require(:job).permit(:job_title, :job_description, :salary, :job_posting_url, :application_deadline, :date_created, :company_id)
  end
end
