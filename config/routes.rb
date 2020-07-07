Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  root 'users#show'
  resources :users do 
    resources :posts do
      member do
        get 'like', to: "posts#like"
        get 'unlike', to: "posts#unlike"
      end
      resources :comments, only: [:create]
    end
  end 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
