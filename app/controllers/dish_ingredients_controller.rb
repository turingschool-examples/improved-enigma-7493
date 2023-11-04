class DishIngredientsController < ApplicationController
  def create
    dish = Dish.find(params[:dishes_id])
    ingredient = Ingredient.find(params[:ingredient_id])
    DishIngredient.create!(dish: dish, ingredient: ingredient)
  
    redirect_to "/dishes/#{dish.id}"
  end

end