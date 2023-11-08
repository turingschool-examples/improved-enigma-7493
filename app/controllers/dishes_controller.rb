class DishesController <ApplicationController
  def show
    @dish = Dish.find(params[:id])
    @chef = Chef.find(params[:chef_id])
  end

  def update
    @dish = Dish.find(params[:id])
    @ingredient = Ingredient.find(params[:add_ingredient])
    @dish.ingredients << @ingredient
    redirect_to "/chef/#{@dish.chef_id}/dishes/#{@dish.id}"
  end

end