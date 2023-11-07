Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/dishes/:id", to: "dishes#show"
  post "/dishes/:id", to: "dishes#create"
  get "/chefs/:id", to: "chefs#show"
end
