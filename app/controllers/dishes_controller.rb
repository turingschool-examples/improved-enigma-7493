class DishesController < ApplicationController 
  def show 
    @dish = Dish.find(params[:id])
  end

  def update
    ingredient = Ingredient.find(params[:ingredient_id])
    dish = Dish.find(params[:id])
    DishIngredient.create!({dish_id: dish.id, ingredient_id: ingredient.id})
    
    redirect_to "/dishes/#{dish.id}"
  end
end