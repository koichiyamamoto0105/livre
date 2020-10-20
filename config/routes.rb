Rails.application.routes.draw do
  root 'users#home'
  root 'books#index'
  devise_for :users
  resources :books
  resources :users, only: [:show, :edit]
end
