class DishIngredientsController < ApplicationController
  def create
    dish = Dish.find(params[:id])
    ingredient = Ingredient.find(params[:ingredient_id])

    dish_ingredient = DishIngredient.create!({
      dish: dish,
      ingredient: ingredient
    })

    redirect_to dish_path(dish)
  end
end