class DishesController < ApplicationController
  def show
    @dish = Dish.find(params[:dish_id])
    @chef = @dish.chef
    @kcals = @dish.kcal_sum
  end
end