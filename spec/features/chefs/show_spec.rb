require "rails_helper"

RSpec.describe "Chefs show page" do
  before(:each) do
    @chef = Chef.create!(name: Faker::Name.name)
    @dish = @chef.dishes.create!(
      name: "Meatballs Marinara",
      description: Faker::Food.description
    )
    @ground_beef = Ingredient.create!(name: "ground beef", calories: 900)
    @marinara = Ingredient.create!(name: "marinara", calories: 85)
    @parmesan = Ingredient.create!(name: "parmesan", calories: 65)
    DishIngredient.create!(dish_id: @dish.id, ingredient_id: @ground_beef.id)
    DishIngredient.create!(dish_id: @dish.id, ingredient_id: @marinara.id)
  end

  it "shows a link to a list of all the ingredients the chef uses" do
    # As a visitor
    # When I visit a chef's show page
    # I see a link to view a list of all ingredients that this chef uses in their dishes.
    # When I click on that link
    # I'm taken to a chef's ingredients index page
    # and I can see a unique list of names of all the ingredients that this chef uses.
    visit chef_path(@chef)

    click_link "Ingredients"

    expect(current_path).to eq(chef_ingredients_path(@chef))

    @chef.ingredients.each do |ingredients|
      expect(page).to have_content ingredients.name
    end
  end
end
