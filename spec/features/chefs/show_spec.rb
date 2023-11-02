require 'rails_helper'

RSpec.describe 'the dish show page' do
  before :each do
    @shawn = Chef.create!(name: "Shawn")
    @chili = Dish.create!(name: "Chili", description: "spicy", chef_id: @shawn.id)
    @pasta = Dish.create!(name: "Pasta", description: "tasty", chef_id: @shawn.id)
    @ingredient1 = @chili.ingredients.create!(name: "Black Beans", calories: 20)
    @ingredient2 = @chili.ingredients.create!(name: "Pinto Beans", calories: 20)
    @ingredient3 = @chili.ingredients.create!(name: "Quinoa", calories: 30)
    @ingredient4 = @chili.ingredients.create!(name: "Hatch Green Chiles", calories: 10)
    @ingredient5 = @chili.ingredients.create!(name: "Dried Pequin", calories: 5)
    @ingredient6 = @chili.ingredients.create!(name: "Canned Hominey", calories: 15)
    @tomato = Ingredient.create!(name: "Tomato Sauce", calories: 10)
    @chili.add_ingredient(@tomato)
    @pasta.add_ingredient(@tomato)
  end

  it "has a link to a list of ingredients the chef uses" do
    visit "/chefs/#{@shawn.id}"

    expect(page).to have_link("Shawn's Ingredients")

    click_link("Shawn's Ingredients")

    expect(current_path).to eq("/chefs/#{@shawn.id}/ingredients")
    save_and_open_page
    expect(page).to have_content(@ingredient1.name)
    expect(page).to have_content(@ingredient2.name)
    expect(page).to have_content(@ingredient3.name)
    expect(page).to have_content(@ingredient4.name)
    expect(page).to have_content(@ingredient5.name)
    expect(page).to have_content(@ingredient6.name)
    expect(page).to have_content(@tomato.name)
  end
end