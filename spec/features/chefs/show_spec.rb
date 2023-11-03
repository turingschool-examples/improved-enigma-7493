require 'rails_helper'

RSpec.describe '/chefs/:chef_id' do
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
    describe 'when I visit /chefs/:chef_id' do
      it 'has a link to view a list of all ingredients' do
        #US 3
        visit "/chefs/#{@gordon.id}"

        expect(page).to have_link("View All Ingredients")
      end

      it 'lists distinct ingredients' do
        #US 3
        visit "/chefs/#{@gordon.id}"
        click_link("View All Ingredients")
      
        expect(current_path).to eq("/chefs/#{@gordon.id}/ingredients")
        expect(page).to have_content("All Ingredients: #{@beef.name}, #{@bread.name}, #{@lettuce.name}, #{@onion.name}, and #{@tomato.name}")
      end
    end
  end
end