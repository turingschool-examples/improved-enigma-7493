require "rails_helper"

RSpec.describe "the chef show page" do
  before :each do
    @chef_1 = Chef.create!(name: "Matty Matheson")
    @dish_1 = @chef_1.dishes.create!(name: "ribs", description: "tasty messy ribs")
    @ingredient_1 = @dish_1.ingredients.create!(name: "raw ribs", calories: 1000)
    @ingredient_2 = @dish_1.ingredients.create!(name: "bbq sauce", calories: 500)
    @ingredient_3 = Ingredient.create!(name: "ranch", calories: 500)
    @ingredient_4 = Ingredient.create!(name: "beans", calories: 500)
  end

  it "has a link to the chef's ingredients index page" do
    visit chef_path(@chef_1)

    expect(page).to have_link("Show All Ingredients")

    click_link "Show All Ingredients"

    expect(current_path).to eq(chef_ingredients_path(@chef_1))
  end
end