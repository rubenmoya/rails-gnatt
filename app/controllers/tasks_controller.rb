class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @project = Project.find(params[:project_id])
    @tasks = @project.tasks
  end

  def show
  end

  def new
    @project = Project.find(params[:project_id])
    @task = @project.tasks.new
    @users = User.all
  end

  def edit
  end

  def create
    @project = Project.find(params[:project_id])
    @task = @project.tasks.new(task_params)

    if @task.save
      redirect_to project_task_path(@project, @task), flash: { :success => "Task has been created successfully" }
    else
      render :new, flash: { :danger => "Task has not been created" }
    end
  end

  def update
    if @task.update(task_params)
      redirect_to project_task_path(@project, @task), flash: { :success => "Task has been updated successfully" }
    else
      render :edit, flash: { :danger => "Task has not been updated" }
    end
  end

  def destroy
    @task.destroy
    redirect_to project_tasks_url, flash: { :success => "Task has been deleted successfully" }
  end

  private

  def set_task
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :project_id, assignments_attributes: [:id, :user_id, :hours, :_destroy])
  end
end
