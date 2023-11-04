Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/chef/:id", to: "chef#show"
  get "/chef/:id/ingredients", to: "ingredients#index"

  resources :chef, only: [:show, :create] do
    resources :dishes, only: [:show, :create, :update]
  end
  
  resources :chef, only: [:show]

  

end
