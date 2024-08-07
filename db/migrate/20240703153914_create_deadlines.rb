class CreateDeadlines < ActiveRecord::Migration[7.0]
  def change
    create_table :deadlines do |t|
      t.references :project, null: false, foreign_key: true
      t.date :due_date
      t.string :description
      t.string :status

      t.timestamps
    end
  end
end
