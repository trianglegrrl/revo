Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
        authenticated :user do
            root 'users#index', as: :authenticated_root
        end

        unauthenticated do
            root 'devise/sessions#new', as: :unauthenticated_root
        end
    end

  resources :action_steps

  resources :leaderboard, only: :index

    resources :check_in, only: %w[index show]

  resources :users do
    resources :default_user_action_steps do
      post 'new'
      post 'create'
      put 'complete'
      put 'open'
    end

    resources :user_action_steps do
      post 'new'
      post 'create'
      put 'complete'
      put 'open'
    end
  end
end
