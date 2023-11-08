class ChefIngredientsController < ApplicationController
  def show
    @chef = Chef.find(params[:id])
    @ingredients = @chef.ingredients_used
  end
end