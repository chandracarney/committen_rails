Rails.application.routes.draw do
  root "home#index"

  resources :users, only: [:index]

  get "auth/github"
  get "auth/:provider/callback" => "sessions#create"
  get "signout" => "sessions#destroy", :as => :signout
end
