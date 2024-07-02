class CreateRevisions < ActiveRecord::Migration[7.0]
  def change
    create_table :revisions do |t|
      t.date :due_date
      t.date :completion_date
      t.references :article, null: false, foreign_key: true

      t.timestamps
    end
  end
end
