class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.references :client, null: false, foreign_key: true
      t.string :status
      t.decimal :compensation
      t.string :url
      t.text :note
      t.float :total_working_hours
      t.decimal :hourly_rate

      t.timestamps
    end
  end
end
