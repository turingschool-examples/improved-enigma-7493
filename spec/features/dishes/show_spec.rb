require "rails_helper"

RSpec.describe "dish show", type: :feature do
  describe 'When a user visits a dish show page, there is information' do
    before(:each) do
      @chef_1 = Chef.create!(name: "Sam")

      @dish_1 = Dish.create!(name: "Vegetable Soup", description: "It has veggies", chef: @chef_1)

      @ingredient_1 = Ingredient.create!(name: "Carrot", calories: 50)
      @ingredient_2 = Ingredient.create!(name: "Celery", calories: 10)
      @ingredient_3 = Ingredient.create!(name: "Onion", calories: 30)

      @dish_1.ingredients << @ingredient_1
      @dish_1.ingredients << @ingredient_2
      @dish_1.ingredients << @ingredient_3

      visit "/dishes/#{@dish_1.id}"
    end

    it 'They see dishes name and description and chefs name' do
      expect(page).to have_content("Vegetable Soup")
      expect(page).to have_content("Description: It has veggies")
    end

    it 'They see a list of ingredients ant total calorie count for that dish' do
      save_and_open_page
      expect(page).to have_content("Ingredients: Carrot Celery Onion")
      expect(page).to have_content("Total Calories: 90")
    end
  end

end
# As a visitor
# When I visit a dish's show page
# I see the dish’s name and description
# And I see a list of ingredients for that dish
# and a total calorie count for that dish
# And I see the chef's name.