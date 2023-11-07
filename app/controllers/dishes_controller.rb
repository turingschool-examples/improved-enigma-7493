class DishesController < ApplicationController
  def show
    @dish = Dish.find(params[:id])
  end

  # I would like to know how I could do the update action 'better' feels very rudimentary 
  def update
    @dish = Dish.find(params[:id])
    @ingredient = Ingredient.find(params[:add_ingredient])
    @dish.ingredients << @ingredient

    redirect_to "/dishes/#{@dish.id}"
  end
end