class ActionStepsController < ApplicationController
  before_action :set_action_step, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /action_steps
  # GET /action_steps.json
  def index
    @action_steps = ActionStep.all
  end

  # GET /action_steps/1
  # GET /action_steps/1.json
  def show
  end

  # GET /action_steps/new
  def new
    @action_step = ActionStep.new
  end

  # GET /action_steps/1/edit
  def edit
  end

  # POST /action_steps
  # POST /action_steps.json
  def create
    @action_step = ActionStep.new(action_step_params)

    respond_to do |format|
      if @action_step.save
        format.html { redirect_to action_steps_path, notice: 'Action step was successfully created.' }
        format.json { render :show, status: :created, location: @action_step }
      else
        format.html { render :new }
        format.json { render json: @action_step.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /action_steps/1
  # PATCH/PUT /action_steps/1.json
  def update
    respond_to do |format|
      if @action_step.update(action_step_params)
        format.html { redirect_to action_steps_path, notice: 'Action step was successfully updated.' }
        format.json { render :show, status: :ok, location: @action_step }
      else
        format.html { render :edit }
        format.json { render json: @action_step.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /action_steps/1
  # DELETE /action_steps/1.json
  def destroy
    @action_step.destroy
    respond_to do |format|
      format.html { redirect_to action_steps_url, notice: 'Action step was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_action_step
      @action_step = ActionStep.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def action_step_params
      params.require(:action_step).permit(:name, :description)
    end
end
