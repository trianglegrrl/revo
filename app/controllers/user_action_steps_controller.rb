class UserActionStepsController < ApplicationController
  before_action :set_user
  before_action :set_user_action_step, only: [:show, :edit, :update, :destroy, :complete, :open]

  # GET /user_action_steps
  # GET /user_action_steps.json
  def index
    @user_action_steps = User.find(params[:user_id]).user_action_steps
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
    @user_action_step = UserActionStep.new(user_action_step_params)

    respond_to do |format|
      if @user_action_step.save
        format.html { redirect_to @user_action_step, notice: 'User action step was successfully created.' }
        format.json { render :show, status: :created, location: @user_action_step }
      else
        format.html { render :new }
        format.json { render json: @user_action_step.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_action_steps/1
  # PATCH/PUT /user_action_steps/1.json
  def update
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
    @user_action_step.destroy
    respond_to do |format|
      format.html { redirect_to user_action_steps_url, notice: 'User action step was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def open
    respond_to do |format|
      if @user_action_step.open!
        format.html { redirect_to user_user_action_steps_url(@user), notice: 'User action step was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_action_step }
      else
        format.html { render :edit }
        format.json { render json: @user_action_step.errors, status: :unprocessable_entity }
      end
    end
  end

  def complete
    respond_to do |format|
      if @user_action_step.complete!
        format.html { redirect_to user_user_action_steps_url(@user), notice: 'User action step was successfully updated.' }
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
      params.require(:user_action_step).permit(:user_id, :action_step_id, :active_date, :expiration_date, :status)
    end
end
