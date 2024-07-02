class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.decimal :compensation
      t.date :deadline
      t.date :initial_draft_date
      t.date :completion_date
      t.string :progress
      t.float :work_hours
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
