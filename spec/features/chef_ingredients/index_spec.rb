require "rails_helper"

RSpec.describe "the chef's ingredients index" do
  before(:each) do
    @chef = Chef.create!(name: "Gordon Ramsey")
    
    @dish1 = @chef.dishes.create!(name: "Chicken Pot Pie", description: "Mom's recipe")
    @dish2 = @chef.dishes.create!(name: "Chocolate Cake", description: "Great Dessert")

    @ingredient1 = Ingredient.create!(name: "Chicken", kcal: 200)
    @ingredient2 = Ingredient.create!(name: "Milk", kcal: 60)
    @ingredient3 = Ingredient.create!(name: "Flour", kcal: 30)
    @ingredient4 = Ingredient.create!(name: "Eggs", kcal: 90)
    @ingredient5 = Ingredient.create!(name: "Cocoa", kcal: 5)

    @dish_ingredient_1 = DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @ingredient1.id)
    @dish_ingredient_2 = DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @ingredient2.id)
    @dish_ingredient_3 = DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @ingredient3.id)
    @dish_ingredient_4 = DishIngredient.create!(dish_id: @dish2.id, ingredient_id: @ingredient2.id)
    @dish_ingredient_5 = DishIngredient.create!(dish_id: @dish2.id, ingredient_id: @ingredient3.id)
    @dish_ingredient_6 = DishIngredient.create!(dish_id: @dish2.id, ingredient_id: @ingredient5.id)
  end

  it "the 'Chef's ingredients' button redirects me to the ingredients index page and shows me a unique list of ingredients that this chef uses" do
    visit "/chefs/#{@chef.id}"
    click_on("#{@chef.name}'s Ingredients")
    expect(current_path).to eq("/chefs/#{@chef.id}/ingredients")
    expect(page).to have_content(@ingredient1.name, count: 1)
    expect(page).to have_content(@ingredient2.name, count: 1)
    expect(page).to have_content(@ingredient3.name, count: 1)
    expect(page).to have_content(@ingredient5.name, count: 1)
  end
end
