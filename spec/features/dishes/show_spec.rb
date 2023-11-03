require 'rails_helper'

RSpec.describe '/dishes/:chef_id' do
  before :each do
    @gordon = Chef.create!(name: "Gordon Ramsay")

    @dish1 = @gordon.dishes.create!(name: "Burger", description: "Wagyu burger")
    @dish2 = @gordon.dishes.create!(name: "Salad", description: "Clean salad")
    @dish3 = @gordon.dishes.create!(name: "Soup", description: "Very warm soup")

    @beef = Ingredient.create!(name: "Beef", calories: 235)
    @lettuce = Ingredient.create!(name: "Lettuce", calories: 50)
    @tomato = Ingredient.create!(name: "Tomato", calories: 15)
    @onion = Ingredient.create!(name: "Onion", calories: 35)
    @bread = Ingredient.create!(name: "Bread", calories: 100)
  
    DishIngredient.create!(dish: @dish1, ingredient: @beef)
    DishIngredient.create!(dish: @dish1, ingredient: @onion)
    DishIngredient.create!(dish: @dish1, ingredient: @tomato)
    DishIngredient.create!(dish: @dish1, ingredient: @bread)
    DishIngredient.create!(dish: @dish2, ingredient: @tomato)
    DishIngredient.create!(dish: @dish2, ingredient: @lettuce)
    DishIngredient.create!(dish: @dish3, ingredient: @bread)
    DishIngredient.create!(dish: @dish3, ingredient: @tomato)
  end

  describe 'as a visitor' do
    describe 'when I visit /dishes/:dish_id' do
      it 'shows dishes name and description' do
        #US 1
        visit "/dishes/#{@dish1.id}"
        
        expect(page).to have_content("Dish's name: Burger")
        expect(page).to have_content("Dish's description: Wagyu burger")
      end

      it 'shows list of ingredients for the dish and calories' do
        #US 1
        visit "/dishes/#{@dish1.id}"

        expect(page).to have_content("Ingredients: #{@beef.name}, #{@bread.name}, #{@onion.name}, and #{@tomato.name}")
        expect(page).to have_content("Total calories: 385")
      end

      it 'shows chef name' do
        #US 1
        visit "/dishes/#{@dish1.id}"

        expect(page).to have_content("Chef's name: Gordon Ramsay")
      end
    end
  end
end