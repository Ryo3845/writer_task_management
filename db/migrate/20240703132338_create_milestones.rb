class CreateMilestones < ActiveRecord::Migration[7.0]
  def change
    create_table :milestones do |t|
      t.references :project, null: false, foreign_key: true
      t.string :name
      t.date :due_date
      t.date :completion_date
      t.string :status

      t.timestamps
    end
  end
end
