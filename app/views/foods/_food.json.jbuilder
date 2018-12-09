json.extract! food, :id, :name, :description, :serving_type, :carbs, :fat, :protein, :calories, :created_at, :updated_at
json.url food_url(food, format: :json)
