class UserActionStep < ApplicationRecord
  include AASM

  belongs_to :user
  belongs_to :action_step

  delegate :full_name, to: :user
  delegate :name, to: :action_step

  scope :previous, -> {
    where("expiration_date < ?", Time.now)
  }

  scope :current, -> {
    where("active_date < ? AND expiration_date > ?", Time.now, Time.now)
  }

  scope :future, -> {
    where("active_date > ?", Time.now)
  }

  scope :last_week, -> {
    where(active_date: 1.week.ago.beginning_of_week..1.week.ago.end_of_week)
  }

  #user_action_steps.previous_weeks(4) gives you the last four weeks
  scope :previous_weeks, ->(weeks) {
    where(active_date: weeks.weeks.ago.beginning_of_week..Time.now)
  }

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
