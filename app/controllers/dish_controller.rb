class DishController < ApplicationController
  def show
    @dish = Dish.find(params[:id])
  end

  def update
    @ingredient = Ingredient.find(params[:ingredient_id])
    @dish = Dish.find(params[:id])
    @dish.ingredients << @ingredient
    redirect_to "/dish/#{@dish.id}"
  end
end
