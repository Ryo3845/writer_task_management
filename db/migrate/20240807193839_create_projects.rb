class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :client
      t.string :title
      t.integer :status
      t.date :task_deadline
      t.date :final_deadline
      t.boolean :final_deadline_not_applicable
      t.string :name
      t.decimal :compensation, precision: 10, scale: 2
      t.string :url
      t.text :note
      t.decimal :total_working_hours, precision: 10, scale: 2

      t.timestamps
    end
  end
end
