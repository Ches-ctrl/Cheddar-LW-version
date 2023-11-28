class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @job_applications = JobApplication.where(user_id: current_user)
    
  end
end
