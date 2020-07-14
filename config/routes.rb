Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  root 'users#index'
  resources :users do
    resources :posts do
      resources :comments, shallow: true
    end
  end
  mount Notifications::Engine => "/notifications"
end
