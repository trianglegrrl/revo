class User < ApplicationRecord
  has_many :user_action_steps

  def full_name
    "#{first_name} #{last_name}"
  end
end
