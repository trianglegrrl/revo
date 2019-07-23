class AddCompletedAtToUserActionSteps < ActiveRecord::Migration[5.2]
  def change
    add_column :user_action_steps, :completed_at, :datetime
  end
end
