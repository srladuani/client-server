Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :tasks

  post 'auth_user' => 'authentication#authenticate_user'
  root to: 'visitors#index'

  # api routes
  namespace :api do
    namespace :v1 do
      resources :tasks
    end
  end
end
