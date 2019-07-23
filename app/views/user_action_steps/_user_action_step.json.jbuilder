json.extract! user_action_step, :id, :user_id, :action_step_id, :active_date, :expiration_date, :status, :created_at, :updated_at
json.url user_action_step_url(user_action_step, format: :json)
