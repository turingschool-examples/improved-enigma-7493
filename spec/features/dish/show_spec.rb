require 'rails_helper'

RSpec.describe "Dish Show Page", type: :feature do
  before :each do
    @chef1 = Chef.create(name: "Ratatouille")
    @dish1 = @chef1.dishes.create(name: "Pasta", description: "Yummys")

    @ingredient1 = Ingredient.create(name: "Cheese", calorie: 20)
    @ingredient2 = Ingredient.create(name: "Pasta", calorie: 10)
    @ingredient3 = Ingredient.create(name: "Sauce", calorie: 5)

    @dish1.ingredients << @ingredient1
    @dish1.ingredients << @ingredient2
    @dish1.ingredients << @ingredient3
  end

  # US 1
  it "displays a dish attributes, list of ingredients, total calorie count, and chefs name" do
    visit dish_path(@dish1.id)

    expect(page).to have_content(@chef1.name)
    expect(page).to have_content(@dish1.name)
    expect(page).to have_content(@dish1.description)

    expect(page).to have_content(@ingredient1.name)
    expect(page).to have_content(@ingredient2.name)
    expect(page).to have_content(@ingredient3.name)

    expect(page).to have_content("Total Calories: #{@dish1.total_calories}")
  end
end