class Ability
  include CanCan::Ability

  def initialize(user)
    return if user.blank?

    if user.admin?
      admin
    elsif user.coach?
      coach
    elsif user.check_in?
      check_in
    elsif user.leaderboard?
      leaderboard
    elsif user.client
      client
    end
  end

  def admin
    can :manage, :all
  end

  def coach
  end

  def check_in
		can [:update], UserActionStep
		can :complete, UserActionStep
		can :read, User
  end

  def leaderboard
    can :leaderboard
  end

  def client
  end
end
