require 'rails_helper'

RSpec.describe "meal_items/index", type: :view do
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

    assign(:meal_items, [
      MealItem.create!(
        food: @food,
        user: @user,
        servings: 2.5
      ),
      MealItem.create!(
        food: @food,
        user: @user,
        servings: 2.5
      )
    ])
  end

  it "renders a list of meal_items" do
    render
    assert_select "tr>td", :text => @food.to_s, :count => 2
    assert_select "tr>td", :text => @user.to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
  end
end
