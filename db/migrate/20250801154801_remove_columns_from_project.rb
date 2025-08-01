class RemoveColumnsFromProject < ActiveRecord::Migration[7.0]
  def change
    remove_columns :projects, :start_date, :due_date, :number_of_characters, :man_hour_measurement, :process, :url
  end
end
