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
    

    @dish_ingredient1 = DishIngredient.create!(dish: @dish1, ingredient: @ingredient1)
    @dish_ingredient2 = DishIngredient.create!(dish: @dish1, ingredient: @ingredient2)
    @dish_ingredient3 = DishIngredient.create!(dish: @dish1, ingredient: @ingredient3)
    @dish_ingredient3 = DishIngredient.create!(dish: @dish1, ingredient: @ingredient4)

    @dish_ingredient4 = DishIngredient.create!(dish: @dish2, ingredient: @ingredient4)
    @dish_ingredient5 = DishIngredient.create!(dish: @dish2, ingredient: @ingredient5)
    @dish_ingredient6 = DishIngredient.create!(dish: @dish2, ingredient: @ingredient6)
    @dish_ingredient7 = DishIngredient.create!(dish: @dish2, ingredient: @ingredient7)    

    @dish_ingredient9 = DishIngredient.create!(dish: @dish3, ingredient: @ingredient9)
    @dish_ingredient10 = DishIngredient.create!(dish: @dish3, ingredient: @ingredient10)
    @dish_ingredient11 = DishIngredient.create!(dish: @dish3, ingredient: @ingredient11)
    @dish_ingredient12 = DishIngredient.create!(dish: @dish3, ingredient: @ingredient12)
  end

  #   As a visitor
  # When I visit a dish's show page
  # I see the dish’s name and description
  # And I see a list of ingredients for that dish
  # and a total calorie count for that dish
  # And I see the chef's name.

  describe "when I visit '/dishes/:id'" do
    it "shows all the dish's name and description" do
      visit "/dishes/#{@dish1.id}"

      expect(page).to have_content(@dish1.name)
      expect(page).to have_content(@dish1.description)
    end

    xit "shows a list of ingredients for that dish" do
      visit "/dishes/#{@dish1.id}"

      expect(page).to have_content(@ingredient1.name)
      expect(page).to have_content(@ingredient2.name)
      expect(page).to have_content(@ingredient3.name)
      expect(page).to have_content(@ingredient4.name)

      exepct(page).to_not have_content(@ingredient5.name)
    end

    xit "shows a total calorie count for that dish" do
      visit "/dishes/#{@dish1.id}"

      expect(page).to have_content("Total Calorie Count: 160")
    end

    xit "shows the chef's name" do
      visit "/dishes/#{@dish1.id}"

      expect(page).to have_content(@chef1.name)
    end
  end
end