class CreateDeadlines < ActiveRecord::Migration[7.0]
  def change
    create_table :deadlines do |t|
      t.references :task, null: false, foreign_key: true
      t.date :due_date

      t.timestamps
    end
  end
end
