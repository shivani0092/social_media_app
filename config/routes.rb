Rails.application.routes.draw do
  mount Notifications::Engine => "/notifications"
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  root 'users#index'
  resources :users do
    resources :posts do
      member do
        get 'like', to: "posts#like"
        get 'unlike', to: "posts#unlike"
      end
      resources :comments, shallow: true
    end
  end
end
