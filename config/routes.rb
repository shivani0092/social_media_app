Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  root 'users#index'
  resources :users do 
    resources :posts do
      member do
        get 'like', to: "posts#like"
        get 'unlike', to: "posts#unlike"
      end
      resources :comments, only: [:create, :index]
    end
  end 
end
