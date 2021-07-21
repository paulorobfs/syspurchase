Rails.application.routes.draw do
  get 'upload/index'
  get 'home/index'
  post 'upload/processa_arquivo'
  root to: 'home#index'

  resources :purchases
  resources :itens
  resources :merchants
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
