class LeaderboardController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.clients.sort_by(&:all_time_percentage).reverse
        authorize! :read, User
  end
end
