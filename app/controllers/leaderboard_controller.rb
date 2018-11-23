class LeaderboardController < ApplicationController
  def index
    @users = User.all.sort_by(&:all_time_percentage).reverse
  end
end
