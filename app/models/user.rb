class User < ApplicationRecord
  has_many :user_action_steps
  def full_name
    "#{first_name} #{last_name}"
  end

  def longest_streak
    longest = 1
    counter = 1

    user_action_steps.order(:created_at).each_with_index do |uas, index|
      if uas.open?
        longest = counter if counter > longest
        counter = 1
      else
        counter += 1
      end
    end

    longest
  end

  def all_time_percentage
    ((user_action_steps.completed.count.to_f / user_action_steps.count) * 100).round
  rescue
    0
  end

  def this_week_percentage
    ((user_action_steps.current.completed.count.to_f / user_action_steps.current.count) * 100).round
  rescue
    0
  end
end
