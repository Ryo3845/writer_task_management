class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.references :project, null: false, foreign_key: true
      t.string :task_type
      t.string :name
      t.string :status

      t.timestamps
    end
  end
end
