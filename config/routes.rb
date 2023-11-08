Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "dish/:id", to: "dish#show"
  patch "dish/:id", to: "dish#update"

  get "chef/:id", to: "chef#show"
  get "chef/:id/ingredients", to: "chef_ingredients#show"
end
