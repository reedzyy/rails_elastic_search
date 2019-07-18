Rails.application.routes.draw do
  resources :categories
  resources :items

  get 'search', to: 'items#search'

  root 'home#index'
end
