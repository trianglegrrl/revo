Rails.application.routes.draw do
  resources :action_steps
  resources :users do
    resources :user_action_steps do
      put 'complete'
      put 'open'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
