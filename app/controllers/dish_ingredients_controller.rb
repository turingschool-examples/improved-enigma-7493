class DishIngredientsController < ApplicationController

  def new
    DishIngredient.create(dish_id: params[:id], ingredient_id: params[:add_ingredient])
    redirect_to "/dishes/#{params[:id]}"
  end

  def destroy
    DishIngredient.where(dish_id: params[:id], ingredient_id: params[:ingredient_id]).first.destroy
    redirect_to "/dishes/#{params[:id]}"
  end
end