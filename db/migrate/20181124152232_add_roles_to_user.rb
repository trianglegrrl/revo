class AddRolesToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :admin, :boolean, default: false
    add_column :users, :coach, :boolean, default: false
    add_column :users, :check_in, :boolean, default: false
    add_column :users, :leaderboard, :boolean, default: false
    add_column :users, :client, :boolean, default: false
  end
end
