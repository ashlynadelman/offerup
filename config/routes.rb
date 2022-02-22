Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  root :to => "items#index"
  resources :searches
  resources :users
  resources :categories
  resources :prices
  resources :items
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
