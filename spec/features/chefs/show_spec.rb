require "rails_helper"

RSpec.describe "chef show", type: :feature do
  describe 'When a user visits a chef show page, there is a link to chefs ingredients index' do
    before(:each) do
      @chef_1 = Chef.create!(name: "Sam")

      visit chef_path(@chef_1)
    end

    it 'They see a link, click it, and are taken to a chefs ingredients index page' do
      expect(page).to have_selector(:link_or_button, "Chef Ingredients")

      click_link("Chef Ingredients")

      expect(current_path).to eq(chef_ingredients_path(@chef_1))
    end
  end

  describe 'Top three ingredients' do
    before(:each) do
      @chef_1 = Chef.create!(name: "Sam")

      @dish_1 = Dish.create!(name: "Vegetable Soup", description: "It has veggies", chef: @chef_1)
      @dish_2 = Dish.create!(name: "Something Soup", description: "It has veggies", chef: @chef_1)
      @dish_3 = Dish.create!(name: "Other Soup", description: "It has veggies", chef: @chef_1)

      @ingredient_1 = Ingredient.create!(name: "Carrot", calories: 50)
      @ingredient_2 = Ingredient.create!(name: "Celery", calories: 10)
      @ingredient_3 = Ingredient.create!(name: "Onion", calories: 30)
      @ingredient_4 = Ingredient.create!(name: "Beets", calories: 30)
      @ingredient_5 = Ingredient.create!(name: "IDK", calories: 30)

      @dish_1.ingredients << @ingredient_1
      @dish_1.ingredients << @ingredient_2
      @dish_1.ingredients << @ingredient_3
      @dish_1.ingredients << @ingredient_4

      @dish_2.ingredients << @ingredient_1
      @dish_2.ingredients << @ingredient_2
      @dish_2.ingredients << @ingredient_3
      @dish_2.ingredients << @ingredient_5

      @dish_3.ingredients << @ingredient_1
      @dish_3.ingredients << @ingredient_2
      @dish_3.ingredients << @ingredient_3

      visit chef_path(@chef_1)
    end

    it 'User sees top three ingredients' do
      expect(page).to have_content("Carrot")
      expect(page).to have_content("Celery")
      expect(page).to have_content("Onion")
    end
  end

end