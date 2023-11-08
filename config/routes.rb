Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # get '/dishes/:id', to: 'dishes#show'
  resources :dishes, only: [:show] do
    resources :ingredients, controller: 'dish_ingredients', only: [:create, :destroy]
  end

  resources :chef, controller: 'chefs', only: [:show] do
    resources :ingredients, controller: 'chef_ingredients', only: [:index]
  end

  # oops, should have named it dish_ingredients for the controller
  # post '/dishes/:dish_id/ingredients', to: 'ingredient_dishes#create'
end
