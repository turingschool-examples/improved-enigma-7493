require "rails_helper"

RSpec.describe Dish, type: :feature do
  before :each do 
    @chef1 = Chef.create(name: "Frenchie")
    @chef2 = Chef.create(name: "Baker Boy")

    @dish1 = @chef1.dishes.create(name: "Soup", description: "Soupy Soup")
    @dish2 = @chef2.dishes.create(name: "Goupy Goup", description: "Goupy Soupy Soup Goup")

    @ingredient1 = Ingredient.create(name: "Onion", calories: 10)
    @ingredient2 = Ingredient.create(name: "Garlic", calories: 20)
    @ingredient3 = Ingredient.create(name: "Tomato", calories: 30)
    @ingredient4 = Ingredient.create(name: "Noodle", calories: 40)
    @ingredient5 = Ingredient.create(name: "Kisses", calories: 50)
    @ingredient6 = Ingredient.create(name: "Hugs", calories: 60)

    DishIngredient.create(dish_id: @dish1.id, ingredient_id: @ingredient1.id)
    DishIngredient.create(dish_id: @dish1.id, ingredient_id: @ingredient2.id)
    DishIngredient.create(dish_id: @dish1.id, ingredient_id: @ingredient3.id)
    DishIngredient.create(dish_id: @dish1.id, ingredient_id: @ingredient4.id)
    DishIngredient.create(dish_id: @dish2.id, ingredient_id: @ingredient5.id)
    DishIngredient.create(dish_id: @dish2.id, ingredient_id: @ingredient6.id)

    
  end
  describe "chef show page" do
    it "has a link to view all ingredients chef uses" do
      # Story 3 of 3
      # As a visitor
      # When I visit a chef's show page
      # I see a link to view a list of all ingredients that this chef uses in their dishes.
      # When I click on that link
      # I'm taken to a chef's ingredients index page
      # and I can see a unique list of names of all the ingredients that this chef uses.

      visit "/chefs/#{@chef1.id}"

      expect(page).to have_link("Ingredients This Chef Uses")
      click_link("Ingredients This Chef Uses")
      expect(current_path).to eq("/chefs/#{@chef1.id}/ingredients")
      
      expect(page).to have_content(@ingredient1.name)
      expect(page).to have_content(@ingredient2.name)
      expect(page).to have_content(@ingredient3.name)
      expect(page).to have_content(@ingredient4.name)
      expect(page).to_not have_content(@ingredient5.name)
      expect(page).to_not have_content(@ingredient6.name)
    end
  end
end