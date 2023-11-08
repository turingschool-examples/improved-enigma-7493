Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
 
  get 'dishes/:id', to: 'dishes#show', as: 'dish'
  post 'dishes/:id/add_ingredient', to: 'dishes#add_ingredient', as: 'add_ingredient_to_dish'

  get 'chefs/:chef_id/ingredients', to: 'chefs/ingredients#index' 
  
  get '/chefs/:id', to: 'chefs#show'



end
