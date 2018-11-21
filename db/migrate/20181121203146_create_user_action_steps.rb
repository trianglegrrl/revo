class CreateUserActionSteps < ActiveRecord::Migration[5.2]
  def change
    create_table :user_action_steps do |t|
      t.references :user, foreign_key: true
      t.references :action_step, foreign_key: true
      t.datetime :active_date
      t.datetime :expiration_date
      t.string :status

      t.timestamps
    end
  end
end
