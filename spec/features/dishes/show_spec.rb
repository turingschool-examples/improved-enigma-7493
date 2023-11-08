require 'rails_helper'

RSpec.describe 'Dish Show Page' do
  describe 'As a visitor' do
    before :each do
    @chef_1 = Chef.create!(name: "Chef Mike")
    @chef_2 = Chef.create!(name: "Chef John")
    @chef_3 = Chef.create!(name: "Chef Bob")

    @dish_1 = Dish.create!(name: "Spaghetti", description: "Spaghetti and Meatballs", chef_id: @chef_1.id)
    @dish_2 = Dish.create!(name: "Pizza", description: "Pepperoni Pizza", chef_id: @chef_2.id)
    @dish_3 = Dish.create!(name: "Burger", description: "Cheeseburger", chef_id: @chef_3.id)

    @ingredient_1 = Ingredient.create!(name: "Spaghetti Noodles", calories: 200)
    @ingredient_2 = Ingredient.create!(name: "Marinara Sauce", calories: 100)
    @ingredient_3 = Ingredient.create!(name: "Meatballs", calories: 150)
    @ingredient_4 = Ingredient.create!(name: "Pizza Dough", calories: 300)
    @ingredient_5 = Ingredient.create!(name: "Pepperoni", calories: 200)
    @ingredient_6 = Ingredient.create!(name: "Cheese", calories: 200)
    @ingredient_7 = Ingredient.create!(name: "Bun", calories: 150)
    @ingredient_8 = Ingredient.create!(name: "Beef Patty", calories: 250)
    @ingredient_9 = Ingredient.create!(name: "Ketchup", calories: 100)
    @ingredient_10 = Ingredient.create!(name: "Mustard", calories: 50)

    @dish_1.ingredients << @ingredient_1
    @dish_1.ingredients << @ingredient_2
    @dish_1.ingredients << @ingredient_3
    @dish_2.ingredients << @ingredient_4
    @dish_2.ingredients << @ingredient_5
    @dish_2.ingredients << @ingredient_6
    @dish_3.ingredients << @ingredient_7
    @dish_3.ingredients << @ingredient_8
    @dish_3.ingredients << @ingredient_9
    @dish_3.ingredients << @ingredient_10
    end
    it 'I see the dish name and description' do

      
      # As a visitor
      # When I visit a dish's show page
      # I see the dish’s name and description
      # And I see a list of ingredients for that dish
      # and a total calorie count for that dish
      # And I see the chef's name.
      
      visit dish_path(@dish_1)

      within("#dish-#{@dish_1.id}") do
        expect(page).to have_content(@dish_1.name)
        expect(page).to have_content(@dish_1.description)
        expect(page).to have_content(450)
      end
        within("#ingredients-#{@dish_1.id}") do
          expect(page).to have_content(@ingredient_1.name)
          expect(page).to have_content(@ingredient_2.name)
        end
          within("#chef-#{@dish_1.id}") do
            expect(page).to have_content(@chef_1.name)        
          end
    end

    it 'I see a form to add an existing ingredient to the dish' do
      # As a visitor
      # When I visit a dish's show page
      # I see a form to add an existing Ingredient to that Dish
      # When I fill in the form with the ID of an Ingredient that exists in the database
      # And I click Submit
      # Then I am redirected to that dish's show page
      # And I see that ingredient is now listed. 
      
      visit dish_path(@dish_1)
      
      expect(page).to have_content("Add an Ingredient to this Dish")

      fill_in :ingredient_id, with: @ingredient_3.id

      click_on "Submit"

      expect(current_path).to eq(dish_path(@dish_1))
      
      expect(page).to have_content(@ingredient_3.name)
      
    end
  end
end