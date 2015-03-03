Rails.application.routes.draw do
  root "home#index"

  namespace :api do
    resources :users
  end

  get "auth/github"
  get "auth/:provider/callback" => "sessions#create"
  get "signout" => "sessions#destroy", :as => :signout
end
