Rails.application.routes.draw do
  namespace :api do
    resources :users
    resources :goals
    resources :commits
    resources :sessions, only: [:create]
  end
end
