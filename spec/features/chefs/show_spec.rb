require "rails_helper"

RSpec.describe "chefs#show" do
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
    @dish_ingredient8 = DishIngredient.create!(dish: @dish2, ingredient:@ingredient8)    

    @dish_ingredient9 = DishIngredient.create!(dish: @dish3, ingredient: @ingredient9)
    @dish_ingredient10 = DishIngredient.create!(dish: @dish3, ingredient: @ingredient10)
    @dish_ingredient11 = DishIngredient.create!(dish: @dish3, ingredient: @ingredient11)
    @dish_ingredient12 = DishIngredient.create!(dish: @dish3, ingredient: @ingredient12)

    @dish_ingredient13 = DishIngredient.create!(dish: @dish2, ingredient: @ingredient1)
    #adding this dish_ingredient to test that distinct ingredients show up on the page and there are
    #not repeats of @ingredient1
  end
    # 3. As a visitor
    # When I visit a chef's show page
    # I see a link to view a list of all ingredients that this chef uses
    # in their dishes.When I click on that link
    # I'm taken to a chef's ingredients index page
    # and I can see a unique list of names of all the ingredients that this chef uses.
  describe "when I visit '/chefs/:id'" do
    describe "User Story 3" do
      it "shows the chef's name and a link to view a list of all the ingredients the chef
       uses in their dishes" do
        visit "/chefs/#{@chef1.id}"

        expect(page).to have_link("All Ingredients")
      end

      it "shows all the chef's ingredients used in all their dishes" do
        visit "/chefs/#{@chef1.id}"

        click_link("All Ingredients")

        expect(current_path).to eq("/chefs/#{@chef1.id}/ingredients")

        expect(page).to have_content("#{@chef1.name}'s Ingredients Index")
        expect(page).to have_content(@ingredient1.name)
        expect(page).to have_content(@ingredient2.name)
        expect(page).to have_content(@ingredient3.name)
        expect(page).to have_content(@ingredient4.name)
        expect(page).to have_content(@ingredient5.name)
        expect(page).to have_content(@ingredient6.name)
        expect(page).to have_content(@ingredient7.name)
        expect(page).to have_content(@ingredient8.name)
      end
    end

    # Extension 2    As a visitor
    # When I visit a chef's show page
    # I see the three most popular ingredients that the chef uses in their dishes
    # (Popularity is based off of how many dishes use that ingredient)
    describe "Extension 2" do
      it "shows the three most popular ingredients that the chef uses in their dishes" do
        visit "/chefs/#{@chef1.id}"

        expect(page).to have_content("#{@chef1.name}'s Most Popular Ingredients:")
      end
      # hit my 3 hour time box starting this one, so did not get beyond writing this test. 
    end
  end
end








