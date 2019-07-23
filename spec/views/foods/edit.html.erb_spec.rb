require 'rails_helper'

RSpec.describe "foods/edit", type: :view do
  before(:each) do
    @food = assign(:food, Food.create!(
      :name => "MyString",
      :description => "MyString",
      :serving_type => "MyString",
      :carbs => 1.5,
      :fat => 1.5,
      :protein => 1.5,
      :calories => 1.5
    ))
  end

  it "renders the edit food form" do
    render

    assert_select "form[action=?][method=?]", food_path(@food), "post" do

      assert_select "input[name=?]", "food[name]"

      assert_select "input[name=?]", "food[description]"

      assert_select "input[name=?]", "food[serving_type]"

      assert_select "input[name=?]", "food[carbs]"

      assert_select "input[name=?]", "food[fat]"

      assert_select "input[name=?]", "food[protein]"

      assert_select "input[name=?]", "food[calories]"
    end
  end
end
