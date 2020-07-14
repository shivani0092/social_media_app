Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  root 'users#index'
  resources :users do
    resources :posts do
      resources :comments, only: [:create]
    end
  end
  resources :posts do
    resources :likes, only: [:create, :destroy]
  end
  mount Notifications::Engine => "/notifications"
end
