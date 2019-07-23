class CreateDefaultUserActionSteps < ActiveRecord::Migration[5.2]
  def change
    create_table :default_user_action_steps do |t|
      t.text :action_step_ids
      t.datetime :starting_at
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
