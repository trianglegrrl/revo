json.extract! meal_item, :id, :meal_id, :user_id, :servings, :created_at, :updated_at
json.url meal_item_url(meal_item, format: :json)
