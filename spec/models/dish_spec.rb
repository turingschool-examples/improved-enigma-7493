require 'rails_helper'

RSpec.describe Dish, type: :model do

  describe "validations" do
      it {should validate_presence_of :name}
      it {should validate_presence_of :description}
  end

  describe "relationships" do
      it {should belong_to :chef}
      it {should have_many(:ingredients).through(:dish_ingredients)}
  end

  describe "calories" do
    it 'calculates the total calories' do
      chef = Chef.create(name: "Test Chef")  
      dish = chef.dishes.create!(name: "Test Dish", description: "Test Description")
        ingredient1 = Ingredient.create!(name: "Test Ingredient 1", calories: 100)
        ingredient2 = Ingredient.create!(name: "Test Ingredient 2", calories: 200)
        dish.dish_ingredients.create!(ingredient: ingredient1)
        dish.dish_ingredients.create!(ingredient: ingredient2)
  
        expect(dish.calories).to eq(300)
      end
    end
end
