require 'rails_helper'

RSpec.describe "meal_items/new", type: :view do
  before(:each) do
    @user = User.create!(
      first_name: "Argle",
      last_name:  "Bargle",
      email:      "argle@bargle.com",
      password:   "abc123"
    )

    @food = Food.create!(
      name: "Toast"
    )

    assign(:meal_item, MealItem.new(
      food: @food,
      user: @user,
      servings: 1.5
    ))
  end

  it "renders new meal_item form" do
    render

    assert_select "form[action=?][method=?]", meal_items_path, "post" do

      assert_select "input[name=?]", "meal_item[food_id]"

      assert_select "input[name=?]", "meal_item[user_id]"

      assert_select "input[name=?]", "meal_item[servings]"
    end
  end
end
