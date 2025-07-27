class AddProcessToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :process, :string
  end
end
