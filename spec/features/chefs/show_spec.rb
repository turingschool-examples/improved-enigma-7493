require "rails_helper"

RSpec.describe "Chef index page" do 
  before :each do 
    @flay = Chef.create!(name: "Bobby Flay")

    @ramen = Dish.create!(name: "Ramen", description: "A really good soup dish", chef_id: @flay.id)
    @noodles = Ingredient.create!(name: "Ramen noodles", calories: 10)
    @broth = Ingredient.create!(name: "Vegetable broth", calories: 15)

    @omelette = Dish.create!(name: "Breakfast Omelette", description: "The best freaking omelette you ever had", chef_id: @flay.id)
    @eggs = Ingredient.create!(name: "Farm fresh eggs", calories: 15)
    @peppers = Ingredient.create!(name: "Bell peppers", calories: 3)
    @cheese = Ingredient.create!(name: "Shreded cheese", calories: 25)

    DishIngredient.create!(dish_id: @ramen.id, ingredient_id: @noodles.id)
    DishIngredient.create!(dish_id: @ramen.id, ingredient_id: @broth.id)

    DishIngredient.create!(dish_id: @omelette.id, ingredient_id: @eggs.id)
    DishIngredient.create!(dish_id: @omelette.id, ingredient_id: @peppers.id)
    DishIngredient.create!(dish_id: @omelette.id, ingredient_id: @cheese.id)
  end

  it "shows a chefs show page with a link to their ingredients" do 
    visit "/chefs/#{@flay.id}"

    expect(page).to have_content("Chef Show Page")
    expect(page).to have_link("Ingredient list")

    click_link("Ingredient list")
    expect(current_path).to eq("/chefs/#{@flay.id}/ingredients")
  end

  it "shows all of the chefs ingredients on their index page" do 
    visit "/chefs/#{@flay.id}/ingredients"

    expect(page).to have_content("#{@flay.name} Ingredient Index Page")
    expect(page).to have_content(@noodles.name)
    expect(page).to have_content(@broth.name)
    expect(page).to have_content(@eggs.name)
    expect(page).to have_content(@peppers.name)
    expect(page).to have_content(@cheese.name)
    save_and_open_page
  end
end