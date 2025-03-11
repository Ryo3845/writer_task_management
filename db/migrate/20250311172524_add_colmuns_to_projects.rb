class AddColmunsToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :number_of_characters, :float
    add_column :projects, :rewards, :float
    add_column :projects, :man_hour_measurement, :time
    add_column :projects, :task, :string
  end
end
