class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def show
  end

  def new
    @project = Project.new
  end

  def create
    @project = current_user.projects.build(project_params)
     if @project.save
      redirect_to projects_path, notice: 'プロジェクトが正常に作成されました。'
    else
      @projects = Project.all
      render :index, status: :unprocessable_entity
    end
  end

  def edit
  end

  private

    def project_params
      params.require(:project).permit(:client, :title, :status, :other_task, :task_deadline, :final_deadline, :final_deadline_not_applicable, :compensation, :url, :note)
    end
end
