require 'rails_helper'

RSpec.describe "MealItems", type: :request do
  describe "GET /meal_items" do
    it "works! (now write some real specs)" do
      get meal_items_path
      expect(response).to have_http_status(200)
    end
  end
end
