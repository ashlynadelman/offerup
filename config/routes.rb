Rails.application.routes.draw do
  scope path: ApplicationResource.endpoint_namespace, defaults: { format: :jsonapi } do
    scope module: 'api/v1', as: 'api' do
      resources :prices

      resources :items

    end
    mount VandalUi::Engine, at: '/vandal'
    # your routes go here
  end
  ActiveAdmin.routes(self)
  root :to => "items#index"
  resources :searches
  resources :users
  resources :categories
  resources :prices
  resources :items
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
