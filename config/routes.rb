Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/dishes/:dish_id", to: "dishes#show"
  post "/dishes/:dish_id", to: "dish_ingredients#create"

  get "/chefs/:chef_id", to: "chefs#show"

  get "/chefs/:chef_id/ingredients", to: "chef_ingredients#index"
end
