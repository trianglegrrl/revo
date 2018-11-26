Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index'

  resources :action_steps

  resources :leaderboard, only: :index

	resources :check_in, only: %w[index show]

  resources :users do
    resources :user_action_steps do
      post 'new'
      post 'create'
      put 'complete'
      put 'open'
    end
  end
end
