Rails.application.routes.draw do
  get '/home/about' =>'books#about'
  root 'users#home'
  devise_for :users
  resources :books, only: [:about, :index, :create, :show, :edit, :update, :destroy]
  resources :users, only: [:home, :index, :create, :show, :edit, :update]
end
