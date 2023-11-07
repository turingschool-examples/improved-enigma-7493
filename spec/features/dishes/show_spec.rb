require 'rails_helper'

# As a visitor
# When I visit a dish's show page
# I see the dish’s name and description
# And I see a list of ingredients for that dish
# and a total calorie count for that dish
# And I see the chef's name.

RSpec.describe "dish show page", type: :feature do
  before :each do 
    @chef1 = Chef.create(name: "Kam")
    @dish1 = @chef1.dishes.create(name: "cereal au lait", description: "lucky charms in a whole milk reduction")
    @milk = Ingredient.create(name: "whole milk", calories: 500)
    @cereal = Ingredient.create(name: "lucky charms", calories: 400)
    @dish1.ingredients << @milk
    @dish1.ingredients << @cereal
  end

  it "shows the dishes name and description" do 
    visit "/dishes/#{@dish1.id}"
    expect(page).to have_content(@dish1.name)
    expect(page).to have_content(@dish1.description)
    expect(page).to have_content(@milk.name)
    expect(page).to have_content(@cereal.name)
    expect(page).to have_content(@milk.calories + @cereal.calories)
    expect(page).to have_content(@chef1.name)
  end
end