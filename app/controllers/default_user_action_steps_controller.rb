class DefaultUserActionStepsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_default_user_action_step, only: :destroy

  # POST /user_action_steps
  # POST /user_action_steps.json
  def create
    authorize! :create, DefaultUserActionStep

    asids = default_user_action_step_params[:action_step_id].reject(&:blank?).map(&:to_i)
    starting_at = default_user_action_step_params[:starting_at]

    DefaultUserActionStep.where(user: @user, action_step_ids: asids, starting_at: starting_at).first_or_create!

    respond_to do |format|
      format.html { redirect_to edit_user_path(@user), notice: 'Default action steps added.' }
      format.json { render :show, status: :created, location: @user_action_step }
    end
  rescue => e
    respond_to do |format|
      format.html { redirect_to edit_user_path(@user), notice: 'Well shit.' }
      format.json { render json: @user_action_step.errors, status: :unprocessable_entity }
    end
  end

  # DELETE /default_user_action_steps/1
  # DELETE /default_user_action_steps/1.json
  def destroy
    authorize! :destroy, @default_user_action_step
    @default_user_action_step.destroy
    respond_to do |format|
      format.html { redirect_to edit_user_path(@user), notice: 'Deleted.' }
      format.json { head :no_content }
    end
  end

  private
    def set_user
      @user = User.find(params[:user_id]) if params[:user_id].present?
    end

    def set_default_user_action_step
      @default_user_action_step = DefaultUserActionStep.find(params[:id] || params[:default_user_action_step_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def default_user_action_step_params
      params.permit(:user_id, :action_step_ids, :active_date)
    end
end
