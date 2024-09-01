Rails.application.routes.draw do
  get 'pages/contact'
  get 'home/index'
  devise_for :users

  # Définir la route pour les catégories
  get 'products/category/:name', to: 'products#category', as: 'category_products'
  get 'contact_us', to: 'pages#contact', as: 'contact_us'
  resources :products do
    collection do
      get 'search'
    end
  end

  resources :bids
  resources :histories
  resources :payments
  resources :reviews
  resources :notifications
  resources :categories

  root 'home#index'
end
