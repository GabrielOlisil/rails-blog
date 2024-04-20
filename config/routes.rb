Rails.application.routes.draw do
  root 'posts#index'

  get 'up' => 'rails/health#show', as: :rails_health_check

  resources :posts do
    resources :comments
    get '/page/:page', action: :index, on: :collection
  end

  post "sign_up", to: "users#create"
  get "sign_up", to: "users#new"
  get "profile", to: "users#show"
  get "profile/edit", to: "users#edit"
  patch "profile/edit", to: "users#update"

  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  get "login", to: "sessions#new"
end
