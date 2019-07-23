require 'rails_helper'

RSpec.describe "meal_items/show", type: :view do
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
      servings: 2.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/2.5/)
  end
end
