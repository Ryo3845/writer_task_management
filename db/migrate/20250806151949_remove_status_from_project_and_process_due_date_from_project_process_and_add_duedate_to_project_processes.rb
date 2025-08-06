class RemoveStatusFromProjectAndProcessDueDateFromProjectProcessAndAddDuedateToProjectProcesses < ActiveRecord::Migration[7.0]
  def change
    remove_column :project_processes, :process_due_date
    add_column :project_processes, :due_date, :date
    remove_column :projects, :status
  end
end
