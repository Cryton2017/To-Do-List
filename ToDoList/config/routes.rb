Rails.application.routes.draw do
  root to: 'landing#index'

  resources :to_dos
  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  post 'signup', to: 'users#new', as: 'signup'
  post 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'dashboard', to: 'to_dos#index', as: 'dashboard'
  get 'newItem', to: 'to_dos#new', as: 'newItem'
end
