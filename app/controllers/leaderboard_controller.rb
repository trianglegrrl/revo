class LeaderboardController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all.sort_by(&:all_time_percentage).reverse
  end
end
