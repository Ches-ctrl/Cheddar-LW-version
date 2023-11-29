class SavedJobsController < ApplicationController
  def index
    @saved_jobs = SavedJob.all.where(user_id: current_user.id)
  end
end
