class CreateProjectProcesses < ActiveRecord::Migration[7.0]
  def change
    create_table :project_processes do |t|
      t.references :project, null: false, foreign_key: true
      t.string :process
      t.date :task_due_date
      t.string :status
      t.text :notes

      t.timestamps
    end
  end
end
