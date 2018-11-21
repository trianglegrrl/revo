class UserActionStep < ApplicationRecord
  belongs_to :user
  belongs_to :action_step
end
