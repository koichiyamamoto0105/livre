Rails.application.routes.draw do
  root 'users#home'
  devise_for :users
  resources :books, only: [:index, :create, :show, :edit, :update, :destroy]
  resources :users, only: [:home, :index, :create, :show, :edit, :update]
end
