class TasksController < ApplicationController
  def index
  	@tasks = Task.where(:is_completed => false).order(:priority)
  end

  def new
  	@task = Task.new
  end

  def show
  end

  def create
  	@task = Task.new(task_params)
  	if @task.save
  		redirect_to root_path
  	end
  end

  def complete_task
    task = Task.find(params[:id])
    task.update_attributes(:is_completed => true)
    redirect_to root_path
  end

  def completed
    @tasks = Task.where(:is_completed => true)
  end

  private

  	def task_params
  		params.require(:task).permit(:title, :category, :priority, :is_completed)
  	end
end
