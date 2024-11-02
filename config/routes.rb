Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  devise_scope :user do
    authenticated :user do
      root 'recipes#index', as: :authenticated_root
      get '/users/sign_out' => 'devise/sessions#destroy'
    end
    unauthenticated do
      root "public_recipes#index", as: :unauthenticated_root
    end
  end

  resources :public_recipes, only: [:index]

  resources :recipes, only: [:index, :new, :create, :show, :destroy] do
    resources :recipe_foods, only: [:index, :show, :new, :create, :destroy]
  end
  resources :foods, only: [:index, :new, :create, :destroy]
  resources :inventories, only: [:index, :new, :create, :show, :destroy]
end
