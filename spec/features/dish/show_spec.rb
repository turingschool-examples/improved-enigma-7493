require "rails_helper"

RSpec.describe "Dish Show Page" do
  describe "As a Visitor" do
    describe "When I visit the Dish Show Page" do
      before(:each) do
        @chef1 = Chef.create!(name: "Bobby Flay")
        @chef2 = Chef.create!(name: "Alton Brown")

        @dish1 = @chef1.dishes.create!(name: "Filet Mignon", description: "Medium Rare")
        @dish2 = @chef1.dishes.create!(name: "Spaghetti", description: "Red Sauce")

        @ingredient1 = Ingredient.create!(name: "Steak", calories: 800)
        @ingredient2 = Ingredient.create!(name: "Potatoes", calories: 1100)

        DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @ingredient1.id)
        DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @ingredient2.id)
        
      end

      #User Story 1
      describe "I see the dish's name and description" do
        it "And I see a list of ingredients, total calorie count and the chef's name" do
          visit "/dishes/#{@dish1.id}"

          expect(page).to have_content(@dish1.name)
          expect(page).to have_content(@dish1.description)
          expect(page).to_not have_content(@dish2.name)

          expect(page).to have_content(@ingredient1.name)
          expect(page).to have_content(@ingredient2.name)
          expect(page).to have_content("Total Calories: 1900")

          expect(page).to have_content(@chef1.name)
        end
      end
    end 
  end 
end