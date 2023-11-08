class DishIngredientController < ApplicationController
  def create
    dish = Dish.find(params[:id])
    ingredient = Ingredient.find(params[:ingredient_id])
    DishIngredient.create(dish: dish, ingredient: ingredient)
    redirect_to "/dishes/#{dish.id}"
  end

  def destroy
    dish = Dish.find(params[:id])
    DishIngredient.find_by(dish_id: params[:id], ingredient_id: params[:ingredient_id]).destroy
    redirect_to "/dishes/#{dish.id}"
  end
end
