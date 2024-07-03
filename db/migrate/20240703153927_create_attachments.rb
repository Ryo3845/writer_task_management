class CreateAttachments < ActiveRecord::Migration[7.0]
  def change
    create_table :attachments do |t|
      t.references :project, null: false, foreign_key: true
      t.string :description
      t.string :url

      t.timestamps
    end
  end
end
