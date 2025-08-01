class ChangeColumnNameInProjectProcesses < ActiveRecord::Migration[7.0]
  def change
    rename_column :project_processes, :task_due_date, :process_due_date
  end
end
