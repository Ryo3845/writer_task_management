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
    @task = current_user.tasks.find(params[:id])
    @tasks = current_user.all
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
      params.require(:task).permit(:due_date, :status)
    end
end
