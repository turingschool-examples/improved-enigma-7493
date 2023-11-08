require "rails_helper"

RSpec.describe "Dishes Show Page", type: :feature do

  before :each do 

    @mario = Chef.create!({name: "Mario"})
    
    @lasagna = Dish.create!({name: "Lasagna", description: "Chef's favorite", chef_id: @mario.id })
    
    @salt = Ingredient.create!({name: "Salt", calories: 200})
    @pepper = Ingredient.create!({name: "Pepper", calories: 25})
    @oregano = Ingredient.create!({name: "Oregano", calories: 75})
    DishIngredient.create!({ dish_id: @lasagna.id, ingredient_id: @salt.id })
    DishIngredient.create!({ dish_id: @lasagna.id, ingredient_id: @pepper.id })
  end
  
  it "shows the dish's name and description" do

    visit "/dishes/#{@lasagna.id}"

    expect(page).to have_content("Lasagna")
    expect(page).to have_content("Pepper")
    expect(page).to have_content("Salt")
    expect(page).to have_content("Mario")
  end
  
  it "has a form to add existing ingredients to the dish" do
    
    visit "/dishes/#{@lasagna.id}"
    expect(page).to have_content("Add ingredient")
    expect(page).to have_field(:ingredient_id)
    expect(page).to have_button("Submit")
    fill_in :ingredient_id, with: @oregano.id
    
    click_button "Submit"
    
    visit "/dishes/#{@lasagna.id}"
    save_and_open_page
    
    expect(page).to have_content("Pepper")
    expect(page).to have_content("Salt")
    expect(page).to have_content("Oregano")
  end
end 