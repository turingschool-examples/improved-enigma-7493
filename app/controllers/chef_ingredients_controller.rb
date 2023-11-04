class ChefIngredientsController < ApplicationController
  def index
    @chef = Chef.find(params[:chef_id])
    @uniq_ingredients = @chef.uniq_ingredients
  end
end