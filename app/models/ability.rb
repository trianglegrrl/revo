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
    can :create, DefaultUserActionStep
    can :administer_users, :all
    can :administer_action_steps, :all
    can :leaderboard, :all
    can :check_in, :all
    can :show_login_header, :all
  end

  def coach
    can :show_login_header, :all
  end

  def check_in
    can [:update, :complete, :read, :open], UserActionStep
    can :complete, UserActionStep
    can :read, User
    can :check_in, :all
  end

  def leaderboard
    can :leaderboard, :all
    can :read, UserActionStep
    can :read, User
  end

  def client
  end
end
