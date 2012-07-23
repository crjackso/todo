class TasksController < ApplicationController
  
  def new
    @user = User.first
  end
  
  def index
    @tasks = User.first.tasks.sort(date_to_be_completed: -1)
  end
  
  def create
    @user = User.find(params[:user_id])
    @comment = @user.tasks.create!(params[:task])
    redirect_to @user, :notice => "Task created!"
  end
end
