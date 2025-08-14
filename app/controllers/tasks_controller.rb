class TasksController < ApplicationController

  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def destroy
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to projects_path
  end

  private

    def task_params
      params.require(:task).permit(:status)
    end
end
