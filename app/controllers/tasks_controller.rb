class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :update, :destroy, :toggle]

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
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to root_path
    else 
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to root_path
  end

  def toggle
    head :no_content
    @task.done = !@task.done
    @task.save
  end

  private
    
    def task_params
      params.require(:task).permit(:title)
    end

    def set_task
      @task = Task.find(params[:id])
    end
end
