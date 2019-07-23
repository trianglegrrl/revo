require 'rails_helper'

RSpec.describe "foods/new", type: :view do
  before(:each) do
    assign(:food, Food.new(
      :name => "MyString",
      :description => "MyString",
      :serving_type => "MyString",
      :carbs => 1.5,
      :fat => 1.5,
      :protein => 1.5,
      :calories => 1.5
    ))
  end

  it "renders new food form" do
    render

    assert_select "form[action=?][method=?]", foods_path, "post" do

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
