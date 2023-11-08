require 'rails_helper'

RSpec.describe 'Dish New Ingredient Application', type: :feature do
  before :each do
    @chef1 = Chef.create(name: "Ratatouille")
    @dish1 = @chef1.dishes.create(name: "Pasta", description: "Yummys")

    @ingredient1 = Ingredient.create(name: "Cheese", calorie: 20)
    @ingredient2 = Ingredient.create(name: "Pasta", calorie: 10)
    @ingredient3 = Ingredient.create(name: "Sauce", calorie: 5)
    @ingredient4 = Ingredient.create(name: "Water", calorie: 1)

    @dish1.ingredients << @ingredient1
    @dish1.ingredients << @ingredient2
    @dish1.ingredients << @ingredient3
  end

  # US 2
  it "displays a form to add a new ingredient object and redirects to dish show page" do
    visit dish_path(@dish1.id)

    expect(page).to have_content("Add New Ingredient")

    expect(page).to_not have_content("Water")

    fill_in 'ingredient_id', with: @ingredient4.id
    click_on 'Add Ingredient'

    expect(current_path).to eq(dish_path(@dish1.id))
    expect(page).to have_content("Water")
    expect(@dish1.total_calories).to be(36)
  end
end