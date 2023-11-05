require "rails_helper"

RSpec.describe "the chef ingredients index page" do
  before :each do
    @chef_1 = Chef.create!(name: "Matty Matheson")
    @dish_1 = @chef_1.dishes.create!(name: "ribs", description: "tasty messy ribs")
    @ingredient_1 = @dish_1.ingredients.create!(name: "raw ribs", calories: 1000)
    @ingredient_2 = @dish_1.ingredients.create!(name: "bbq sauce", calories: 500)
    @ingredient_3 = @dish_1.ingredients.create!(name: "ranch", calories: 500)
    @ingredient_4 = Ingredient.create!(name: "beans", calories: 500)
  end

  it "shows a unique list of all the chef's ingredients" do
    visit chef_ingredients_path(@chef_1)

    expect(page).to have_content(@ingredient_1.name)
    expect(page).to have_content(@ingredient_2.name)
    expect(page).to have_content(@ingredient_3.name)
    expect(page).to_not have_content(@ingredient_4.name)
  end
end