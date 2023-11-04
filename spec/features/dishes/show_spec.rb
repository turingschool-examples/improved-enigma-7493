require "rails_helper"

RSpec.describe "dishes#show" do
  before(:each) do
    @chef1 = Chef.create!(name: "Boyardi")
    @chef2 = Chef.create!(name: "Soup King")

    @dish1 = @chef1.dishes.create!(name: "Hamburger", description: "Burger on a bun with toppings")
    @dish2 = @chef1.dishes.create!(name: "Pasta", description: "Noodles in a sauce")

    @dish3 = @chef2.dishes.create!(name: "Soup", description: "Buncha vegetables in a pot blended")
    
    @ingredient1 = Ingredient.create!(name: "Ground Beef", calories: 100)
    @ingredient2 = Ingredient.create!(name: "Slice O Cheese", calories: 50)
    @ingredient3 = Ingredient.create!(name: "Lettuce", calories: 5)
    @ingredient4 = Ingredient.create!(name: "Tomato", calories: 5)

    @ingredient5 = Ingredient.create!(name: "Noodles", calories: 100)
    @ingredient6 = Ingredient.create!(name: "Red Sauce", calories: 50)
    @ingredient7 = Ingredient.create!(name: "Parmesan Cheese", calories: 10)
    @ingredient8 = Ingredient.create!(name: "Oregano", calories: 5)

    @ingredient9 = Ingredient.create!(name: "Potato", calories: 20)
    @ingredient10 = Ingredient.create!(name: "Carrot", calories: 20)
    @ingredient11 = Ingredient.create!(name: "Cabbage", calories: 10)
    @ingredient12 = Ingredient.create!(name: "Onion", calories: 20)

    @ingredient13 = Ingredient.create!(name: "Fries", calories: 10)
    

    @dish_ingredient1 = DishIngredient.create!(dish: @dish1, ingredient: @ingredient1)
    @dish_ingredient2 = DishIngredient.create!(dish: @dish1, ingredient: @ingredient2)
    @dish_ingredient3 = DishIngredient.create!(dish: @dish1, ingredient: @ingredient3)
    @dish_ingredient3 = DishIngredient.create!(dish: @dish1, ingredient: @ingredient4)

    @dish_ingredient4 = DishIngredient.create!(dish: @dish2, ingredient: @ingredient4)
    @dish_ingredient5 = DishIngredient.create!(dish: @dish2, ingredient: @ingredient5)
    @dish_ingredient6 = DishIngredient.create!(dish: @dish2, ingredient: @ingredient6)
    @dish_ingredient7 = DishIngredient.create!(dish: @dish2, ingredient: @ingredient7)    
    @dish_ingredient8 = DishIngredient.create!(dish: @dish2, ingredient: @ingredient8)

    @dish_ingredient9 = DishIngredient.create!(dish: @dish3, ingredient: @ingredient9)
    @dish_ingredient10 = DishIngredient.create!(dish: @dish3, ingredient: @ingredient10)
    @dish_ingredient11 = DishIngredient.create!(dish: @dish3, ingredient: @ingredient11)
    @dish_ingredient12 = DishIngredient.create!(dish: @dish3, ingredient: @ingredient12)
  end

  #  1. As a visitor
  # When I visit a dish's show page
  # I see the dish’s name and description
  # And I see a list of ingredients for that dish
  # and a total calorie count for that dish
  # And I see the chef's name.

  describe "when I visit '/dishes/:id'" do
    describe "User Story 1" do
      it "shows all the dish's name and description" do
        visit "/dishes/#{@dish1.id}"

        expect(page).to have_content(@dish1.name)
        expect(page).to have_content("Description: #{@dish1.description}")
      end

      it "shows a list of ingredients for that dish" do
        visit "/dishes/#{@dish1.id}"

        expect(page).to have_content(@ingredient1.name)
        expect(page).to have_content(@ingredient2.name)
        expect(page).to have_content(@ingredient3.name)
        expect(page).to have_content(@ingredient4.name)

        expect(page).to_not have_content(@ingredient5.name)
      end

      it "shows a total calorie count for that dish" do
        visit "/dishes/#{@dish1.id}"

        expect(page).to have_content("Total Calorie Count: 160")
      end

      it "shows the chef's name" do
        visit "/dishes/#{@dish1.id}"

        expect(page).to have_content("Created by Chef: #{@chef1.name}")
      end
    end

      # As a visitor
      # When I visit a dish's show page
      # I see a form to add an existing Ingredient to that Dish
      # When I fill in the form with the ID of an Ingredient that exists in the database
      # And I click Submit
      # Then I am redirected to that dish's show page
      # And I see that ingredient is now listed. 
    describe "User Story 2" do
      it "shows a form to add an existing ingredient to that dish" do
        visit "/dishes/#{@dish1.id}"

        expect(page).to have_content("Add an Existing Ingredient:")
        expect(page).to have_field(:ingredient_id)
        # save_and_open_page
        expect(page).to have_button("Add Ingredient")
      end

      it "when the form is filled in with the ID of an existing ingredient and I 
      click submit, then I am redirected to the dish's show page and I see it listed" do
        visit "/dishes/#{@dish1.id}"

        expect(page).to_not have_content(@ingredient13.name)

        fill_in(:ingredient_id, with: "#{@ingredient13.id}")
        click_button("Add Ingredient")

        expect(page).to have_current_path("/dishes/#{@dish1.id}")

        expect(page).to have_content(@ingredient13.name)
      end
    end
      # As a visitor
      # When I visit a dish's show page
      # I see a button next to each ingredient to delete that ingredient from a dish
      # And when I click that button
      # I am redirected back to that page
      # And the ingredient is no longer listed.
    describe "Extension 1" do
      it "I see a button next to each ingredient to delete that ingredient" do
        visit "/dishes/#{@dish1.id}"

        within("#dish_ingredient-#{@ingredient1.id}") do
          expect(page).to have_button("Delete #{@ingredient1.name}")
        end
        within("#dish_ingredient-#{@ingredient2.id}") do
          expect(page).to have_button("Delete #{@ingredient2.name}")
        end
        within("#dish_ingredient-#{@ingredient3.id}") do
          expect(page).to have_button("Delete #{@ingredient3.name}")
        end
        within("#dish_ingredient-#{@ingredient4.id}") do
          expect(page).to have_button("Delete #{@ingredient4.name}")
        end
      end

      it "when I click that button I am redirected back to that page and 
      no longer see the ingredient listed" do
        visit "/dishes/#{@dish1.id}"

        within("#dish_ingredient-#{@ingredient2.id}") do
          click_button("Delete #{@ingredient2.name}")
        end

        expect(current_path).to eq("/dishes/#{@dish1.id}")

        expect(page).to_not have_content(@ingredient2.name)
      end
    end
  end
end