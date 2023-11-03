require "rails_helper"

RSpec.describe "Show page" do 
  before :each do 
    @flay = Chef.create!(name: "Bobby Flay")
    @ramen = Dish.create!(name: "Ramen", description: "A really good soup dish", chef_id: @flay.id)
    @noodles = Ingredient.create!(name: "Ramen noodles", calories: 10)
    @noodles = Ingredient.create!(name: "Ramen noodles", calories: 10)
    @broth = Ingredient.create!(name: "Vegetable broth", calories: 15)
    @ginger = Ingredient.create!(name: "Ginger", calories: 3)
    @mushrom = Ingredient.create!(name: "Mushroom", calories: 8)

    DishIngredient.create!(dish_id: @ramen.id, ingredient_id: @noodles.id)
    DishIngredient.create!(dish_id: @ramen.id, ingredient_id: @broth.id)
    DishIngredient.create!(dish_id: @ramen.id, ingredient_id: @ginger.id)
    DishIngredient.create!(dish_id: @ramen.id, ingredient_id: @mushrom.id)
  end

  it "shows a dish's name, ingredients, calories, and the chef" do
    visit "/dishes/#{@ramen.id}"


  end
end