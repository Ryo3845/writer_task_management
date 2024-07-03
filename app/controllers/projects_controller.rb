class ProjectsController < ApplicationController

  def index
  end

  def show
    @project = Projects.find(params[:id])
  end
end
