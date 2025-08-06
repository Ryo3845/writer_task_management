class AddColmnsTaskAndStatusAndRemoveProcessFromProjectProcesses < ActiveRecord::Migration[7.0]
  def change
    add_column :project_processes, :task, :string
    add_column :project_processes, :status, :string
    remove_columns :project_processes, :process
  end
end
