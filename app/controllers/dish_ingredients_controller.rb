class DishIngredientsController < ApplicationController
  def create
    @ingredient = Ingredient.find(params[:ingredient])
    @dish = Dish.find(params[:dish_id])
    IngredientDish.create!(ingredient: @ingredient, dish: @dish)

    redirect_to dish_path(@dish)
  end
end