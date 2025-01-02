class AddOtherTaskToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :string
  end
end
