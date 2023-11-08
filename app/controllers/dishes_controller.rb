class DishesController < ApplicationController
  def show
    @dish = Dish.find(params[:id])
  end

  def add_ingredient
    @dish = Dish.find(params[:id])
    @dish.ingredients << Ingredient.find(params[:dish][:ingredient_ids])
    redirect_to dish_path(@dish)
  end
end

