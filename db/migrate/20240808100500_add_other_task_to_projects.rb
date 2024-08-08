class AddOtherTaskToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :other_task, :string
  end
end
