require 'rails_helper'

RSpec.describe "chef show page", type: :feature do 
  before :each do
    @chef1 = Chef.create(name: "Kam")
    @dish1 = @chef1.dishes.create(name: "cereal au lait", description: "lucky charms in a whole milk reduction")
    @milk = Ingredient.create(name: "whole milk", calories: 500)
    @cereal = Ingredient.create(name: "lucky charms", calories: 400)
    @extra_sugar = Ingredient.create(name: "extra sugar", calories: 20000)
    @dish1.ingredients << @milk
    @dish1.ingredients << @cereal
  end

# As a visitor
# When I visit a chef's show page
# I see a link to view a list of all ingredients that this chef uses in their dishes.
# When I click on that link
# I'm taken to a chef's ingredients index page
# and I can see a unique list of names of all the ingredients that this chef uses.

  it "has a list of all the ingredients the chef uses" do
    visit "chef/#{@chef1.id}"
    expect(page).to have_content(@chef1.name)
    expect(page).to have_link("#{@chef1.name}'s ingredients")
    click_link("#{@chef1.name}'s ingredients")
    expect(page).to have_content(@milk.name)
    expect(page).to have_content(@cereal.name)
  end
end