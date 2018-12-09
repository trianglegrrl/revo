class MealItemsController < ApplicationController
  before_action :set_meal_item, only: [:show, :edit, :update, :destroy]

  # GET /meal_items
  # GET /meal_items.json
  def index
    @meal_items = MealItem.all
  end

  # GET /meal_items/1
  # GET /meal_items/1.json
  def show
  end

  # GET /meal_items/new
  def new
    @meal_item = MealItem.new
  end

  # GET /meal_items/1/edit
  def edit
  end

  # POST /meal_items
  # POST /meal_items.json
  def create
    @meal_item = MealItem.new(meal_item_params)

    respond_to do |format|
      if @meal_item.save
        format.html { redirect_to @meal_item, notice: 'Meal item was successfully created.' }
        format.json { render :show, status: :created, location: @meal_item }
      else
        format.html { render :new }
        format.json { render json: @meal_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meal_items/1
  # PATCH/PUT /meal_items/1.json
  def update
    respond_to do |format|
      if @meal_item.update(meal_item_params)
        format.html { redirect_to @meal_item, notice: 'Meal item was successfully updated.' }
        format.json { render :show, status: :ok, location: @meal_item }
      else
        format.html { render :edit }
        format.json { render json: @meal_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meal_items/1
  # DELETE /meal_items/1.json
  def destroy
    @meal_item.destroy
    respond_to do |format|
      format.html { redirect_to meal_items_url, notice: 'Meal item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meal_item
      @meal_item = MealItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meal_item_params
      params.require(:meal_item).permit(:meal_id, :user_id, :servings)
    end
end
