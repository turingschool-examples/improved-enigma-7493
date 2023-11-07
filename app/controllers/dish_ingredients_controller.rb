class DishIngredientsController < ApplicationController

  def create
    dish_ingredient = DishIngredient.new(dish_id: params[:dish_id], ingredient_id: params[:ingredient_id])
    if dish_ingredient.save
      redirect_back(fallback_location: "/")
    else
      flash[:error] = "Ingredient Not Saved!"
    end
  end
end