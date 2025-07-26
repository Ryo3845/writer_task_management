class AddTaskStatusToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :task_status, :string
  end
end
