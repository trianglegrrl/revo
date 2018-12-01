class UsersController < ApplicationController
  authorize_resource
  before_action :verify_admin
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all.order(:last_name, :first_name)
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to edit_user_path(@user), notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

        def verify_admin
            # Only allow access to this controller if they're an admin
            head :unauthorized unless can?(:administer_users, :all)
        end

    def set_user
      @user = User.find(params[:id])

      @user_action_steps = @user.user_action_steps
      @default_user_action_steps = @user.default_user_action_steps
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      user_params = params.require(:user).permit(:first_name, :last_name, :password, :password_confirmation, :email, :public, :admin, :client, :check_in, :leaderboard)

      if(user_params[:password].blank?)
        user_params.except(:password, :password_confirmation)
      else
        user_params
      end
    end
end
