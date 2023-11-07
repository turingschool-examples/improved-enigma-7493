class DishesController < ApplicationController
  def show
    @dish = Dish.find(params[:id])
  end

  def update
    DishIngredient.create!(dish_id: params[:dish_id], ingredient_id: params[:ingredient_id])
    redirect_to "/dishes/#{params[:id]}"
  end
end