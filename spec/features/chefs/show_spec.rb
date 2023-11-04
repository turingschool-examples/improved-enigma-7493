require "rails_helper"

RSpec.describe "the chef's show page" do
  before(:each) do
    @chef = Chef.create!(name: "Gordon Ramsey")
    
    @dish1 = @chef.dishes.create!(name: "Chicken Pot Pie", description: "Mom's recipe")

    @ingredient1 = Ingredient.create!(name: "Chicken", kcal: 200)
    @ingredient2 = Ingredient.create!(name: "Milk", kcal: 60)
    @ingredient3 = Ingredient.create!(name: "Flour", kcal: 30)
    @ingredient4 = Ingredient.create!(name: "Eggs", kcal: 90)

    @dish_ingredient_1 = DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @ingredient1.id)
    @dish_ingredient_2 = DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @ingredient2.id)
    @dish_ingredient_3 = DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @ingredient3.id)
  end

  it "shows the chef's name and has a link to all ingredients that the chef uses" do
    visit "/chefs/#{@chef.id}"
    expect(page).to have_content("#{@chef.name}")
    expect(page).to have_link("#{@chef.name}'s Ingredients")
  end
end
