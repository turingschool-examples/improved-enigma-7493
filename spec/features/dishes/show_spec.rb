require "rails_helper"

RSpec.describe "the dish's show page" do
  before(:each) do
    @chef1 = Chef.create!(name: "Gordon Ramsey")
    
    @dish1 = @chef1.dishes.create!(name: "Chicken Pot Pie", description: "Mom's recipe")

    @ingredient1 = Ingredient.create!(name: "Chicken", kcal: 200)
    @ingredient2 = Ingredient.create!(name: "Milk", kcal: 60)
    @ingredient3 = Ingredient.create!(name: "Flour", kcal: 30)
    @ingredient4 = Ingredient.create!(name: "Eggs", kcal: 90)

    @dish_ingredient_1 = DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @ingredient1.id)
    @dish_ingredient_2 = DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @ingredient2.id)
    @dish_ingredient_3 = DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @ingredient3.id)
  end

  it "show the dish's name. description, list of ingredients, total kcal and the chef's name" do
    visit "/dishes/#{@dish1.id}"
    expect(page).to have_content("#{@dish1.name}")
    expect(page).to have_content("Description: #{@dish1.description}")
    expect(page).to have_content("KCal: #{@dish1.kcal_sum}")
    expect(page).to have_content("Chef: #{@chef1.name}")
    expect(page).to have_content("Ingredients List")

    expect(page).to have_content(@ingredient1.name)
    expect(page).to have_content(@ingredient2.name)
    expect(page).to have_content(@ingredient3.name)
  end

  it "shows a form to add an ingredient and has an 'Add Ingredient' button" do
    visit "/dishes/#{@dish1.id}"
    expect(page).to have_field("search", type: "text")
    expect(page).to have_button("Add Ingredient")
  end

  it "adds the ingredient to the dish when I click the 'Add Ingredient' button" do
    visit "/dishes/#{@dish1.id}"
    fill_in "search", with: "#{@ingredient4.id}"
    click_on("Add Ingredient")
    expect(current_path).to eq("/dishes/#{@dish1.id}")
    expect(page).to have_content(@ingredient4.name)
  end
end
