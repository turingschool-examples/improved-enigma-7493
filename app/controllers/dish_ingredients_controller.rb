class DishIngredientsController < ApplicationController
  def create
    @dish = Dish.find(params[:dish_id])
    if params[:search].present?
      ingredient = Ingredient.find(params[:search]) 
      DishIngredient.create!(dish_id: @dish.id, ingredient_id: ingredient.id)
      redirect_to "/dishes/#{@dish.id}"
    end
  end
end