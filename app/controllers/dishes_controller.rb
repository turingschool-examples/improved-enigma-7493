class DishesController < ApplicationController
  def show
    @dishes = Dish.all
  end

end