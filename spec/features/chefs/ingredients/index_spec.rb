require "rails_helper"

RSpec.describe "chef ingredients index", type: :feature do
  describe 'When a user visits a chef ingredients show page, there is information' do
    before(:each) do
      @chef_1 = Chef.create!(name: "Sam")
      @chef_2 = Chef.create!(name: "Max")

      @dish_1 = Dish.create!(name: "Vegetable Soup", description: "It has veggies", chef: @chef_1)
      @dish_2 = Dish.create!(name: "Spaghetti", description: "It is yummy", chef: @chef_1)
      @dish_3 = Dish.create!(name: "Steak", description: "It is meat", chef: @chef_2)

      @ingredient_1 = Ingredient.create!(name: "Carrot", calories: 50)
      @ingredient_2 = Ingredient.create!(name: "Celery", calories: 10)
      @ingredient_3 = Ingredient.create!(name: "Onion", calories: 30)
      @ingredient_4 = Ingredient.create!(name: "Pasta", calories: 200)
      @ingredient_5 = Ingredient.create!(name: "Beef", calories: 50)
      # Will see these ingredients, unique list
      @dish_1.ingredients << @ingredient_1
      @dish_1.ingredients << @ingredient_2
      @dish_1.ingredients << @ingredient_3
      @dish_2.ingredients << @ingredient_3
      @dish_2.ingredients << @ingredient_4
      # Will not see this ingredient
      @dish_3.ingredients << @ingredient_5

      visit chef_ingredients_path(@chef_1)
    end

    it 'They will not see ingredients used by another chef' do
      expect(page).to_not have_content("Beef")
    end

    it 'They will see a unique list of ingredients used by this chef' do
      expect(page).to have_content("Carrot", count: 1)
      expect(page).to have_content("Celery", count: 1)
      expect(page).to have_content("Onion", count: 1)
      expect(page).to have_content("Pasta", count: 1)
    end
  end

end