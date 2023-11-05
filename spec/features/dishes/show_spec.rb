require "rails_helper"

RSpec.describe "the dish show page" do
  before :each do
    @chef_1 = Chef.create!(name: "Matty Matheson")
    @dish_1 = @chef_1.dishes.create!(name: "ribs", description: "tasty messy ribs")
    @ingredient_1 = @dish_1.ingredients.create!(name: "raw ribs", calories: 1000)
    @ingredient_2 = @dish_1.ingredients.create!(name: "bbq sauce", calories: 500)
    @ingredient_3 = Ingredient.create!(name: "ranch", calories: 500)
    @ingredient_4 = Ingredient.create!(name: "beans", calories: 500)
  end

  it "shows the dish's name, description, and ingredients" do
    visit dish_path(@dish_1)

    expect(page).to have_content(@dish_1.name)
    expect(page).to have_content(@dish_1.description)
    expect(page).to have_content("Ingredients: raw ribs and bbq sauce")
  end

  it "shows the dish's total calorie count and chef name" do
    visit dish_path(@dish_1)

    expect(page).to have_content("Total Calories: 1500")
    expect(page).to have_content(@dish_1.chef.name)
  end

  it "has a form to add an ingredient to the dish" do
    visit dish_path(@dish_1)

    within("#add_ingredient_form") do
      expect(page).to have_field(:ingredient_id)
      expect(page).to have_button("Add Ingredient")
    end
  end

  it "when form is submitted it redirects back and shows the new ingredient" do
    visit dish_path(@dish_1)

    within("#add_ingredient_form") do
      fill_in :ingredient_id, with: @ingredient_3.id
      click_button "Add Ingredient"
    end

    expect(current_path).to eq(dish_path(@dish_1))
    expect(page).to have_content(@ingredient_3.name)
    expect(page).to_not have_content(@ingredient_4.name)
    expect(page).to have_content("Total Calories: 2000")
  end
end