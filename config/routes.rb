Rails.application.routes.draw do
  devise_for :users

  # Ressources principales
  resources :users, only: [:index, :show, :edit, :update, :destroy]
  resources :products
  resources :bids
  resources :histories
  resources :payments
  resources :reviews
  resources :notifications
  resources :categories

  # Route racine
  root 'home#index'

  # Routes personnalisées pour Devise
  get '/login', to: 'devise/sessions#new', as: 'login'
  post '/login', to: 'devise/sessions#create'
  delete '/logout', to: 'devise/sessions#destroy', as: 'logout'

  get '/signup', to: 'devise/registrations#new', as: 'signup'
  post '/signup', to: 'devise/registrations#create'
end
