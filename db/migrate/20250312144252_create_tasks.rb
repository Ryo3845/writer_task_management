class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :task
      t.date :task_start_date
      t.date :task_due_date
      t.time :task_man_hour_measurement

      t.timestamps
    end
  end
end
