class CreateDeadlines < ActiveRecord::Migration[7.0]
  def change
    create_table :deadlines do |t|
      t.date :due_date
      t.references :task_group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
