Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/chefs/:id", to: "chefs#show"
  
  get "/dishes/:id", to: "dishes#show"

  post "/dishes/:dishes_id/ingredients", to: "dish_ingredients#create"
end
