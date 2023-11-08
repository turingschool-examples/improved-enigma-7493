require 'rails_helper'

RSpec.describe Chef, type: :model do

  describe "validations" do
      it {should validate_presence_of :name}
  end

  describe "relationships" do
      it {should have_many :dishes}
  end

  it 'lists unique ingredients' do
    chef = Chef.create(name: "Test Chef")  
    dish = chef.dishes.create!(name: "Test Dish", description: "Test Description")
      ingredient1 = Ingredient.create!(name: "Test Ingredient 1", calories: 100)
      ingredient2 = Ingredient.create!(name: "Test Ingredient 2", calories: 200)
      ingredient3 = Ingredient.create!(name: "Test Ingredient 2", calories: 200)
      dish.dish_ingredients.create!(ingredient: ingredient1)
      dish.dish_ingredients.create!(ingredient: ingredient2)
      dish.dish_ingredients.create!(ingredient: ingredient2)
      dish.dish_ingredients.create!(ingredient: ingredient2)

      expect(chef.ingredient_list).to eq([ingredient1.name, ingredient2.name])
  end 
end