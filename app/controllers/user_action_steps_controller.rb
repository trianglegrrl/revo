class UserActionStepsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_user_action_step, only: [:show, :edit, :update, :complete, :open]

  # GET /user_action_steps
  # GET /user_action_steps.json
  def index
        authorize! :read, UserActionStep
    @user_action_steps = User.find(params[:user_id]).user_action_steps.order(status: :desc)
  end

  # GET /user_action_steps/1
  # GET /user_action_steps/1.json
  def show
  end

  # GET /user_action_steps/new
  def new
    @user_action_step = UserActionStep.new(user: @user)
  end

  # GET /user_action_steps/1/edit
  def edit
  end

  # POST /user_action_steps
  # POST /user_action_steps.json
  def create
    authorize! :create, UserActionStep
    params[:action_step_id].reject(&:blank?).each do |action_step|
      as = ActionStep.find(action_step)
      ad = params[:active_date]
      ed = params[:expiration_date]

      UserActionStep.where(user: @user, action_step: as, active_date: ad, expiration_date: ed).first_or_create!
    end

    respond_to do |format|
      format.html { redirect_to edit_user_path(@user), notice: 'Card was successfully created.' }
      format.json { render :show, status: :created, location: @user_action_step }
    end
  rescue => e
    respond_to do |format|
      format.html { redirect_to edit_user_path(@user), notice: 'Well shit.' }
      format.json { render json: @user_action_step.errors, status: :unprocessable_entity }
    end
  end

  # PATCH/PUT /user_action_steps/1
  # PATCH/PUT /user_action_steps/1.json
  def update
    authorize! :update, @user_action_step
    respond_to do |format|
      if @user_action_step.update(user_action_step_params)
        format.html { redirect_to @user_action_step, notice: 'User action step was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_action_step }
      else
        format.html { render :edit }
        format.json { render json: @user_action_step.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_action_steps/1
  # DELETE /user_action_steps/1.json
  def destroy
    @user_action_step = UserActionStep.find(params[:id] || params[:user_action_step_id])
    authorize! :destroy, @user_action_step
    @user_action_step.destroy
    respond_to do |format|
      format.html { redirect_to edit_user_path(@user), notice: 'Card was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def open
    authorize! :open, UserActionStep
    respond_to do |format|
      if @user_action_step.open!
        if (current_user.check_in?)
          redirect = check_in_index_url
        else
          redirect = users_path
        end
        format.html { redirect_to redirect, notice: 'Updated!' }
        format.json { render :show, status: :ok, location: @user_action_step }
      else
        format.html { render :edit }
        format.json { render json: @user_action_step.errors, status: :unprocessable_entity }
      end
    end
  end

  def complete
    authorize! :complete, UserActionStep
    respond_to do |format|
      if @user_action_step.complete!
        if (current_user.check_in?)
          redirect = check_in_index_url
        else
          redirect = users_path
        end

        format.html { redirect_to redirect, notice: "Great work, #{@user_action_step.user.first_name}!" }
        format.json { render :show, status: :ok, location: @user_action_step }
      else
        format.html { render :edit }
        format.json { render json: @user_action_step.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_user
      @user = User.find(params[:user_id]) if params[:user_id].present?
    end

    def set_user_action_step
      @user_action_step = UserActionStep.find(params[:id] || params[:user_action_step_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_action_step_params
      params.permit(:user_id, :action_step_id, :active_date, :expiration_date, :status)
    end
end
