class ChangeRewardsToInteger < ActiveRecord::Migration[7.0]
  def change
    change_column :projects, :rewards, :integer
  end
end
