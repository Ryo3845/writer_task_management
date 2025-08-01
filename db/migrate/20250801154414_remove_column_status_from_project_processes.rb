class RemoveColumnStatusFromProjectProcesses < ActiveRecord::Migration[7.0]
  def change
    remove_column :project_processes, :status
  end
end
