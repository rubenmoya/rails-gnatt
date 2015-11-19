class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def show
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to @project, flash: { :success => "Project has been created successfully" }
    else
      render :new, flash: { :warning => "Project has not been created" }
    end
  end

  def update
    if @project.update(project_params)
      redirect_to @project, flash: { :success => "Project has been updated successfully" }
    else
      render :edit, flash: { :warning => "Project has not been updated" }
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_url, flash: { :success => "Project has been deleted successfully" }
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name)
  end
end
