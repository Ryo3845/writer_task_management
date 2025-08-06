class AddProjectAndRemoveKeywordFromProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :project, :string
    remove_columns :projects, :keyword
  end
end
