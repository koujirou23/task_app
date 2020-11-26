class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.valid?
       @task.save
       redirect_to root_path
    elsif 
      render :new
    end
  end

  private
    
    def task_params
      params.require(:task).permit(:title)
    end

end
