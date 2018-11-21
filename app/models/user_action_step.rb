class UserActionStep < ApplicationRecord
  include AASM

  belongs_to :user
  belongs_to :action_step

  delegate :full_name, to: :user
  delegate :name, to: :action_step

  aasm(column: 'status') do
    state :open, initial: true
    state :completed

    event :complete do
      transitions(from: :open, to: :completed)
    end

    event :open do
      transitions(from: :completed, to: :open)
    end
  end
end
