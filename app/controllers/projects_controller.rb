class ProjectsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @client = Client.find(params[:client_id])
    @project = Project.new
  end

  def create
    @client = Client.find(params[:client_id])
    @project = @client.projects.new(project_params)
    if @project.save
      redirect_to project_path(@project)
    else
      render 'new'
    end
  end

  private

  def project_params
    params
      .require(:project)
      .permit(:name, :budget_hours, :deadline)
  end
end
