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
    @extra_sugar = Ingredient.create(name: "extra sugar", calories: 20000)
    @dish1.ingredients << @milk
    @dish1.ingredients << @cereal
  end

  it "shows the dishes name and description" do 
    visit "/dish/#{@dish1.id}"
    expect(page).to have_content(@dish1.name)
    expect(page).to have_content(@dish1.description)
    expect(page).to have_content(@milk.name)
    expect(page).to have_content(@cereal.name)
    expect(page).to have_content(@milk.calories + @cereal.calories)
    expect(page).to have_content(@chef1.name)
  end

    # As a visitor
    # When I visit a dish's show page
    # I see a form to add an existing Ingredient to that Dish
    # When I fill in the form with the ID of an Ingredient that exists in the database
    # And I click Submit
    # Then I am redirected to that dish's show page
    # And I see that ingredient is now listed. 
  it "has a form to add existing ingredients to a dish" do 
    visit "/dish/#{@dish1.id}"
    expect(page).to have_field(:ingredient_id)
    fill_in :ingredient_id, with:@extra_sugar.id
    click_button("Submit")
    expect(current_path).to eq("/dish/#{@dish1.id}")
    expect(page).to have_content("#{@extra_sugar.name}")
  end
end