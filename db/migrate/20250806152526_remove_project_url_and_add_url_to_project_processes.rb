class RemoveProjectUrlAndAddUrlToProjectProcesses < ActiveRecord::Migration[7.0]
  def change
    remove_column :projects, :project_url
    add_column :projects, :url, :date
  end
end
