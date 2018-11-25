class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all

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
    can [:update, :read], :User
  end

  def coach
  end

  def check_in
  end

  def leaderboard
    can :leaderboard
  end

  def client
  end
end
