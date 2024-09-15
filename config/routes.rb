Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :sentences
  resources :words
  resources :users
  resources :games
  resources :game_scores
  post "auth/login", to: "auth#login"
end
