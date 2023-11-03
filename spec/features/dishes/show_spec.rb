require "rails_helper"
require "faker"

RSpec.describe "Dishes Show Page" do
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

  it "shows details about a dish" do
    # As a visitor
    # When I visit a dish's show page
    # I see the dish’s name and description
    # And I see a list of ingredients for that dish
    # and a total calorie count for that dish
    # And I see the chef's name.
    visit dish_path(@dish)

    expect(page).to have_content @dish.name
    expect(page).to have_content @dish.description

    within ".ingredients" do
      @dish.ingredients.each do |ingredient|
        expect(page).to have_content ingredient.name
      end
    end

    expect(page).to have_content "Calories: #{@dish.calories}"
    expect(page).to have_content "Chef: #{@chef.name}"
  end

  it "has form to add ingredient to dish" do
    # As a visitor
    # When I visit a dish's show page
    # I see a form to add an existing Ingredient to that Dish
    # When I fill in the form with the ID of an Ingredient that exists in the database
    # And I click Submit
    # Then I am redirected to that dish's show page
    # And I see that ingredient is now listed.
    visit dish_path(@dish)

    fill_in "Add Ingredient", with: @parmesan.id
    click_button "Add"

    within ".ingredients" do
      @dish.ingredients.each do |ingredient|
        expect(page).to have_content ingredient.name
      end
    end

    expect(page).to have_content "Calories: 1050"
  end

  it "has a button to remove a ingredient from the dish" do
    # As a visitor
    # When I visit a dish's show page
    # I see a button next to each ingredient to delete that ingredient from a dash
    # And when I click that button
    # I am redirected back to that page
    # And the ingredient is no longer listed.
    visit dish_path(@dish)

    within "#ingredient-#{@marinara.id}" do
      click_button "Remove Ingredient"
    end

    within ".ingredients" do
      expect(page).to have_content @ground_beef.name
      expect(page).to_not have_content @marinara.name
    end
  end
end
