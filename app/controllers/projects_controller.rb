class ProjectsController < ApplicationController
  def index
    @projects = Project.all
    @project = Project.new  # indexでも新規プロジェクト用のフォームを表示する場合
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to projects_path, notice: 'プロジェクトが正常に作成されました。'
    else
      @projects = Project.all
      render :index, status: :unprocessable_entity
    end
  end

  private

  def project_params
    params.require(:project).permit(:client, :title, :task_type, :name, :formation_deadline, :manuscript_deadline, :cms_deadline, :other_deadline, :status, :compensation, :url, :note)
  end
end
