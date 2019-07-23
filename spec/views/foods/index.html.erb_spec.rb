require 'rails_helper'

RSpec.describe "foods/index", type: :view do
  before(:each) do
    assign(:foods, [
      Food.create!(
        :name => "Name",
        :description => "Description",
        :serving_type => "Serving Type",
        :carbs => 2.5,
        :fat => 3.5,
        :protein => 4.5,
        :calories => 5.5
      ),
      Food.create!(
        :name => "Name",
        :description => "Description",
        :serving_type => "Serving Type",
        :carbs => 2.5,
        :fat => 3.5,
        :protein => 4.5,
        :calories => 5.5
      )
    ])
  end

  it "renders a list of foods" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Serving Type".to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
    assert_select "tr>td", :text => 4.5.to_s, :count => 2
    assert_select "tr>td", :text => 5.5.to_s, :count => 2
  end
end
