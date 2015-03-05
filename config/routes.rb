Rails.application.routes.draw do
  root "home#index"

  namespace :api do
    resources :users
    resources :goals
    resources :commits
    resources :sessions, only: [:create]
  end

  get "auth/github"
  get "auth/:provider/callback" => "sessions#create"
  get "signout" => "sessions#destroy", :as => :signout
end
