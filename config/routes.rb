Rails.application.routes.draw do
  get 'public_recipes/index'
  get 'foods/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "public_recipes#index"

  resources :public_recipes, only: [:index]

  resources :recipes, only: [:index, :new, :create, :show, :destroy]
  resources :foods, only: [:index, :new, :create, :destroy]
  resources :inventories, only: [:index, :new, :create, :show, :destroy]
end
