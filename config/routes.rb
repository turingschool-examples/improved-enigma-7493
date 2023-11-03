Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # dishes
  get "/dishes/:id", to: "dishes#show"
  post "/dishes/:id/ingredients", to: "dish_ingredients#create"

  # chefs
  get "/chefs/:id", to: "chefs#show"

  # chefs ingredients 
  get "/chefs/:id/ingredients", to: "chef_ingredients#index"
end
