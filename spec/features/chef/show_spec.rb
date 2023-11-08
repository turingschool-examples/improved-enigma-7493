require 'rails_helper' 

RSpec.describe "Chef Show Page", type: :feature do
  before :each do
    @chef1 = Chef.create(name: "Ratatouille")
    @dish1 = @chef1.dishes.create(name: "Pasta", description: "Yummys")
    @dish2 = @chef1.dishes.create(name: "Sushi", description: "Yummers")

    @ingredient1 = Ingredient.create(name: "Cheese", calorie: 20)
    @ingredient2 = Ingredient.create(name: "Pasta", calorie: 10)
    @ingredient3 = Ingredient.create(name: "Sauce", calorie: 5)

    @ingredient4 = Ingredient.create(name: "Salmon", calorie: 2)
    @ingredient5 = Ingredient.create(name: "Tuna", calorie: 3)
    @ingredient6 = Ingredient.create(name: "Cheese", calorie: 20)

    @dish1.ingredients << @ingredient1
    @dish1.ingredients << @ingredient2
    @dish1.ingredients << @ingredient3

    @dish2.ingredients << @ingredient4
    @dish2.ingredients << @ingredient5
    @dish2.ingredients << @ingredient6
  end

  # US 3
  it "displays a link to view all ingredients that the chef used in their dishes" do
    visit chef_path(@chef1.id)

    expect(page).to have_link("All Dish Ingredients")
    click_link("All Dish Ingredients")
    expect(current_path).to eq(chef_ingredients_path(@chef1.id))

    expect(page).to have_content("Cheese")
    expect(page).to have_content("Pasta")
    expect(page).to have_content("Sauce")
    expect(page).to have_content("Salmon")
    expect(page).to have_content("Tuna")
    save_and_open_page
    expect(@chef1.all_ingredients.length).to eq(5)
  end
end