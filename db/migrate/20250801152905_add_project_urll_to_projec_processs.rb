class AddProjectUrllToProjecProcesss < ActiveRecord::Migration[7.0]
  def change
    add_column :project_processes, :project_url, :string
  end
end
