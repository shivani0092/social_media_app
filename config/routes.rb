Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  root 'users#index'
  resources :users do
    resources :posts do
      member do
        patch 'like', to: "posts#like"
        patch 'unlike', to: "posts#unlike"
      end
      resources :comments, shallow: true
    end
  end
  mount Notifications::Engine => "/notifications"
end
