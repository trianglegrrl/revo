class DefaultUserActionStep < ApplicationRecord
  belongs_to :user

  serialize :action_step_ids, Array
end
