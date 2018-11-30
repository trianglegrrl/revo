class User < ApplicationRecord
  devise :database_authenticatable,
         :recoverable,
         :rememberable,
         :validatable,
         :lockable,
         :trackable

  has_many :user_action_steps
  has_many :default_user_action_steps

  accepts_nested_attributes_for :user_action_steps

  scope :clients, -> {
    where(client: true)
  }

  def full_name
    "#{first_name} #{last_name}"
  end

  def current_streak
    user_action_steps.order(created_at: :desc).index(&:open?)
  end

  def longest_streak
    longest = 0
    counter = 1

    user_action_steps.order(created_at: :desc).each_with_index do |uas, index|
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
    ((user_action_steps.from_beginning.completed.count.to_f / user_action_steps.from_beginning.count) * 100).round
  rescue
    0
  end

  def this_week_percentage
    ((user_action_steps.current.completed.count.to_f / user_action_steps.current.count) * 100).round
  rescue
    0
  end

	def generate_new_user_action_steps!
		duas = default_user_action_steps.current.first

		starting_date = duas.starting_at
		ending_date = duas.starting_at.end_of_week

		duas[:action_step_ids].each do |asid|
			UserActionStep.where(
													user_id: id,
													action_step_id: asid,
													active_date: starting_date,
													expiration_date: ending_date,
													status: 'open'
													).first_or_create!
		end
	end

  protected

    def confirmation_required?
        false
    end
end
