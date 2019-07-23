# frozen_string_literal: true

class AddDeviseToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :encrypted_password, :string, default: ""
    add_column :users, :reset_password_token, :string, default: ""
    add_column :users, :reset_password_sent_at, :datetime
    add_column :users, :remember_created_at, :datetime

    add_column :users, :sign_in_count, :integer, default: 0, null: false
    add_column :users, :current_sign_in_at, :datetime
    add_column :users, :last_sign_in_at, :datetime
    add_column :users, :current_sign_in_ip, :string
    add_column :users, :last_sign_in_ip, :string
    add_column :users, :confirmation_token, :string
    add_column :users, :confirmed_at, :datetime
    add_column :users, :confirmation_sent_at, :datetime
    add_column :users, :unconfirmed_email, :string

    add_column :users, :failed_attempts, :integer, default: 0, null: false

    add_column :users, :unlock_token, :string
    add_column :users, :locked_at, :datetime

    add_index :users, :email,                unique: true
    add_index :users, :first_name
    add_index :users, :last_name
    add_index :users, :reset_password_token
    add_index :users, :confirmation_token
    add_index :users, :unlock_token
  end

  def self.down
    # By default, we don't want to make any assumption about how to roll back a migration when your
    # model already existed. Please edit below which fields you would like to remove in this migration.
    raise ActiveRecord::IrreversibleMigration
  end
end
