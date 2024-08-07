class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def show
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to projects_path, notice: 'プロジェクトが正常に作成されました。'
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private

    def project_params
      params.require(:project).permit(:title, :client_id)
    end


end
