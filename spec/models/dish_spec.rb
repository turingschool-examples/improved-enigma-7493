require 'rails_helper'

RSpec.describe Dish, type: :model do
  before :each do
    @gordon = Chef.create!(name: "Gordon Ramsay")

    @dish1 = @gordon.dishes.create!(name: "Burger", description: "Wagyu burger")
    @dish2 = @gordon.dishes.create!(name: "Salad", description: "Clean salad")
    @dish3 = @gordon.dishes.create!(name: "Soup", description: "Very warm soup")

    @beef = Ingredient.create!(name: "Beef", calories: 235)
    @lettuce = Ingredient.create!(name: "Lettuce", calories: 50)
    @tomato = Ingredient.create!(name: "Tomato", calories: 15)
    @onion = Ingredient.create!(name: "Onion", calories: 35)
    @bread = Ingredient.create!(name: "Bread", calories: 100)
  
    DishIngredient.create!(dish: @dish1, ingredient: @beef)
    DishIngredient.create!(dish: @dish1, ingredient: @onion)
    DishIngredient.create!(dish: @dish1, ingredient: @tomato)
    DishIngredient.create!(dish: @dish1, ingredient: @bread)
    DishIngredient.create!(dish: @dish2, ingredient: @tomato)
    DishIngredient.create!(dish: @dish2, ingredient: @lettuce)
    DishIngredient.create!(dish: @dish3, ingredient: @bread)
    DishIngredient.create!(dish: @dish3, ingredient: @tomato)
  end

  describe "validations" do
      it {should validate_presence_of :name}
      it {should validate_presence_of :description}
  end

  describe "relationships" do
      it {should belong_to :chef}
      it {should have_many :dish_ingredients}
      it {should have_many(:ingredients).through(:dish_ingredients)}
  end

  describe 'list_ingredients' do
    it 'lists ingredients for the dish' do
      expect(@dish1.list_ingredients.to_sentence).to eq("Beef, Bread, Onion, and Tomato")
    end
  end

  describe 'total_calories' do
    it 'calculates total calories for a dish' do
      expect(@dish1.total_calories).to eq(385)
    end
  end
end