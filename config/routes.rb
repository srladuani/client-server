Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :tasks

  root to: 'visitors#index'

  # api routes
  namespace :api do
    namespace :v1 do
      resources :tasks
    end
  end
end
