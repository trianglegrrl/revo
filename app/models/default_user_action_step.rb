class DefaultUserActionStep < ApplicationRecord
  belongs_to :user

  serialize :action_step_ids, Array

  scope :current, -> {
    where('starting_at < ?', Time.now).order(starting_at: :desc).limit(1)
  }

  scope :future, -> {
    where('starting_at > ?', Time.now).order(:starting_at)
  }
end
