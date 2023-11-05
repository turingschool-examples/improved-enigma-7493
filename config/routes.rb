Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :dishes, only: :show
  post "/dishes/:id/ingredients", to: "dishes/ingredients#create"
  resources :chefs, only: :show do
    resources :ingredients, controller: "chefs/ingredients", only: :index
  end
end
