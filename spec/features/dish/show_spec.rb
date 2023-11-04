require 'rails_helper'

RSpec.describe 'dish show page' do
  before (:each) do
    @paul = Chef.create!(name: "Paul") 
    @prue = Chef.create!(name: "Prue")

    @grilledcheese = @paul.dishes.create!(name: "Grilled Cheese", description: "Bread and Cheese", calories: 500)
    @turkeysandwich = @paul.dishes.create!(name: "Turkey Sandwich", description: "Bread and Cheese", calories: 600)
    @cake = @prue.dishes.create!(name: "Chocolate Cake", description: "Delicious", calories: 1000)
    @scone = @prue.dishes.create!(name: "Blueberry Scone", description: "ehh", calories: 700)

  end

  # As a visitor
  # When I visit a dish's show page
  # I see the dish’s name and description
  # And I see a list of ingredients for that dish
  # and a total calorie count for that dish
  # And I see the chef's name.


end