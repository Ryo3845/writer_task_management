class CreateTaskGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :task_groups do |t|
      t.string :group_type
      t.string :status
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
