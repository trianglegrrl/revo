require 'rails_helper'

RSpec.describe "meal_items/edit", type: :view do
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

    @meal_item = assign(:meal_item, MealItem.create!(
      food: @food,
      user: @user,
      servings: 1.5
    ))
  end

  it "renders the edit meal_item form" do
    render

    assert_select "form[action=?][method=?]", meal_item_path(@meal_item), "post" do

      assert_select "input[name=?]", "meal_item[food_id]"

      assert_select "input[name=?]", "meal_item[user_id]"

      assert_select "input[name=?]", "meal_item[servings]"
    end
  end
end
