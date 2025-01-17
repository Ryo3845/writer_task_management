class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :client
      t.string :title
      t.integer :task
      t.date :task_deadline
      t.decimal :compensation, precision: 10, scale: 2
      t.string :url
      t.text :note
      t.timestamps
    end
  end
end
