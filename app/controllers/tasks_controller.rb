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

  def completed
    task = Task.find(params[:task])
    tasks.each {|task| task.update_attributes(:is_completed => true) }
    @tasks = Task.where(:is_completed => true)
    # redirect_to root_path
  end

  private

  	def task_params
  		params.require(:task).permit(:title, :category, :priority, :is_completed)
  	end
end
