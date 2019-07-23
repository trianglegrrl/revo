class CheckInController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: :show

  def index
    @users = User.all.clients.order(:last_name, :first_name)
        authorize! :read, User
  end

    def show
        authorize! :update, @user
    end

  private

  def set_user
    @user = User.find(params[:id])

    @user_action_steps = @user.user_action_steps
  end
end
