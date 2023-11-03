class DishIngredientsController < ApplicationController
  def create 
    # require 'pry'; binding.pry
    dish = Dish.find(params[:id])
    ingredient = Ingredient.find(params[:ingredient_id])
    DishIngredient.create!(dish: dish, ingredient: ingredient)
    redirect_to "/dishes/#{dish.id}"
  end
end