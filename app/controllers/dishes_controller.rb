class DishesController < ApplicationController

  def show
    @dish = Dish.find(params[:id])
  end

  def update
    @dish = Dish.find(params[:id])
    if params[:delete_ingredient].present?
      @ingredient = Ingredient.find(params[:delete_ingredient])
      @dish.ingredients.delete(@ingredient)
    else
      @ingredient = Ingredient.find(params[:ingredient_id])
      @dish.ingredients << @ingredient
    end
    redirect_to "/dishes/#{@dish.id}"
  end
end