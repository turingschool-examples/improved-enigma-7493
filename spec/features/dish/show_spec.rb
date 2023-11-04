require 'rails_helper'

RSpec.describe 'dish show page' do
  before (:each) do
    @paul = Chef.create!(name: "Paul") 
    @prue = Chef.create!(name: "Prue")

    @grilledcheese = @paul.dishes.create!(name: "Grilled Cheese", description: "Bread and Cheese")
    @turkeysandwich = @paul.dishes.create!(name: "Turkey Sandwich", description: "Bread and Cheese")
    @cake = @prue.dishes.create!(name: "Chocolate Cake", description: "Delicious")
    @scone = @prue.dishes.create!(name: "Blueberry Scone", description: "ehh")

    @blueberry = Ingredient.create!(name: "blueberry", calories: 1)
    @flour = Ingredient.create!(name: "flour", calories: 455)

    @dish_ingredient1 = DishIngredient.create!(dish_id: @scone.id, ingredient_id: @blueberry.id)
    @dish_ingredient2 = DishIngredient.create!(dish_id: @scone.id, ingredient_id: @flour.id)

  end

  describe 'visit dish show page' do
    it 'shows the dishes name and description' do
      visit "/chef/#{@paul.id}/dishes/#{@grilledcheese.id}"
      expect(page).to have_content(@grilledcheese.name)
      expect(page).to have_content(@grilledcheese.description)
    end
    it 'shows the ingredients and total calories' do
      visit "/chef/#{@prue.id}/dishes/#{@scone.id}"
      expect(page).to have_content(@blueberry.name)
      expect(page).to have_content(@flour.name)
    end
  
  end
  # As a visitor
  # When I visit a dish's show page
  # I see the dish’s name and description
  # And I see a list of ingredients for that dish
  # and a total calorie count for that dish
  # And I see the chef's name.


end