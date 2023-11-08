Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/dishes/:id', to: 'dishes#show'
  patch '/dishes/:id', to: 'dish_ingredients#new'

  get '/chefs/:id', to: 'chefs#show'
  get '/chefs/:id/ingredients', to: 'chefs/ingredients#index'

  delete "/dishes/:id/ingredients/:ingredient_id", to: "dish_ingredients#destroy"
end
