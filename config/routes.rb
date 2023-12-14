Rails.application.routes.draw do
  resources :movies, only: %i[index show]
  resources :reviews, only: %i[create edit update destroy]
  resources :users, only: %i[show]

  root to: 'movies#index'
end
