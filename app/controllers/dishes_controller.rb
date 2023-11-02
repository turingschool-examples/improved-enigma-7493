class DishesController < ApplicationController
  def show
    @dish = Dish.find(params[:id])
    @ingredients = @dish.ingredients
  end

  def update
    @dish = Dish.find(params[:id])
    @ingredient = Ingredient.find(params[:ingredient_id])
    @dish.add_ingredient(@ingredient)
    redirect_to "/dishes/#{@dish.id}"
  end
end