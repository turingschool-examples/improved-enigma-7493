Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/dishes/:id", to: "dishes#show"
  patch "/dishes/:id", to: "dish_ingredients#new"

end
