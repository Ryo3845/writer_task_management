class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.references :client, null: false, foreign_key: true
      t.decimal :compensation
      t.date :final_deadline
      t.float :target_working_hours
      t.float :actual_working_hours
      t.decimal :hourly_rate
      t.string :status

      t.timestamps
    end
  end
end
