require "rails_helper"

RSpec.describe "Chef Show Page" do
  describe "As a Visitor" do
    describe "When I visit the Chef Show Page" do
      before(:each) do
        @chef1 = Chef.create!(name: "Bobby Flay")
        @chef2 = Chef.create!(name: "Alton Brown")

        @dish1 = @chef1.dishes.create!(name: "Filet Mignon", description: "Medium Rare")
        @dish2 = @chef1.dishes.create!(name: "Spaghetti", description: "Red Sauce")

        @ingredient1 = Ingredient.create!(name: "Steak", calories: 800)
        @ingredient2 = Ingredient.create!(name: "Potatoes", calories: 1100)
        @ingredient3 = Ingredient.create!(name: "Asparagus", calories: 100)

        DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @ingredient1.id)
        DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @ingredient2.id)
        
        
      end

      #User Story 3
      describe "I see a link to view a list of all ingredients that this chef uses in their dishes" do
        it "When I click the link I'm taken to the chef's index page and I see a unique list of names of all the ingredients that this chef uses" do
          visit "/chefs/#{@chef1.id}"

          expect(page).to_not have_content(@ingredient1.name)
          expect(page).to_not have_content(@ingredient2.name)

          expect(page).to have_link("List of ingredients this chef uses in their dishes")

          click_on "List of ingredients this chef uses in their dishes"

          expect(current_path).to eq("/chefs/#{@chef1.id}/ingredients")

          expect(page).to have_content(@ingredient1.name)
          expect(page).to have_content(@ingredient2.name)
        end
      end
    end 
  end 
end 