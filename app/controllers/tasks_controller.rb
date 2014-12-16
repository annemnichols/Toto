class TasksController < ApplicationController
  def index
  	@tasks = Task.all.order(:priority)
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

  private

  	def task_params
  		params.require(:task).permit(:title, :category, :priority)
  	end
end
