Rails.application.routes.draw do
  resources :action_steps

  resources :leaderboard, only: :index

  resources :users do
    resources :user_action_steps do
      post 'new'
      post 'create'
      put 'complete'
      put 'open'
    end
  end
end
