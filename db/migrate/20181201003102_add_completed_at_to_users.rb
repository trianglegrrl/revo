class AddCompletedAtToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :completed_at, :datetime
  end
end
