require "rails_helper"

RSpec.describe MealItemsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/meal_items").to route_to("meal_items#index")
    end

    it "routes to #new" do
      expect(:get => "/meal_items/new").to route_to("meal_items#new")
    end

    it "routes to #show" do
      expect(:get => "/meal_items/1").to route_to("meal_items#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/meal_items/1/edit").to route_to("meal_items#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/meal_items").to route_to("meal_items#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/meal_items/1").to route_to("meal_items#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/meal_items/1").to route_to("meal_items#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/meal_items/1").to route_to("meal_items#destroy", :id => "1")
    end
  end
end
