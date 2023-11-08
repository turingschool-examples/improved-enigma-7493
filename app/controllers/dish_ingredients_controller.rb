class DishIngredientsController < ApplicationController
  def create
    @ingredient = Ingredient.find(params[:ingredient])
    @dish = Dish.find(params[:dish_id])
    IngredientDish.create!(ingredient: @ingredient, dish: @dish)

    redirect_to dish_path(@dish)
  end

  def destroy
    ingredient = Ingredient.find(params[:id])
    dish = Dish.find(params[:dish_id])
    dish.ingredients.delete(ingredient)

    redirect_to dish_path(dish)
  end
end