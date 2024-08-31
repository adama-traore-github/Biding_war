Rails.application.routes.draw do
  get 'categories/index'
  get 'categories/show'
  get 'categories/new'
  get 'categories/create'
  get 'categories/edit'
  get 'categories/update'
  get 'categories/destroy'
  get 'notifications/index'
  get 'notifications/show'
  get 'notifications/new'
  get 'notifications/create'
  get 'notifications/edit'
  get 'notifications/update'
  get 'notifications/destroy'
  get 'reviews/index'
  get 'reviews/show'
  get 'reviews/new'
  get 'reviews/create'
  get 'reviews/edit'
  get 'reviews/update'
  get 'reviews/destroy'
  get 'payments/index'
  get 'payments/show'
  get 'payments/new'
  get 'payments/create'
  get 'payments/edit'
  get 'payments/update'
  get 'payments/destroy'
  get 'histories/index'
  get 'histories/show'
  get 'histories/new'
  get 'histories/create'
  get 'histories/edit'
  get 'histories/update'
  get 'histories/destroy'
  get 'bids/index'
  get 'bids/show'
  get 'bids/new'
  get 'bids/create'
  get 'bids/edit'
  get 'bids/update'
  get 'bids/destroy'
  get 'products/index'
  get 'products/show'
  get 'products/new'
  get 'products/create'
  get 'products/edit'
  get 'products/update'
  get 'products/destroy'
  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/create'
  get 'users/edit'
  get 'users/update'
  get 'users/destroy'


  devise_for :users

  resources :users, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :products, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :bids, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :histories, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :payments, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :reviews, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :notifications, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :categories, only: [:index, :show, :new, :create, :edit, :update, :destroy]


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
