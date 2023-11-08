require 'rails_helper'

RSpec.describe Chef, type: :model do
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
    DishIngredient.create!(dish: @dish2, ingredient: @onion)
    DishIngredient.create!(dish: @dish1, ingredient: @tomato)
    DishIngredient.create!(dish: @dish1, ingredient: @bread)
    DishIngredient.create!(dish: @dish2, ingredient: @tomato)
    DishIngredient.create!(dish: @dish2, ingredient: @lettuce)
    DishIngredient.create!(dish: @dish3, ingredient: @bread)
    DishIngredient.create!(dish: @dish3, ingredient: @tomato)
  end

  describe "validations" do
      it {should validate_presence_of :name}
  end

  describe "relationships" do
      it {should have_many :dishes}
      it {should have_many(:ingredients).through(:dishes)}
  end

  describe 'distinct_ingredients' do
    it 'shows distinct ingredients used by chef' do
      expect(@gordon.distinct_ingredients).to eq([@beef.name, @bread.name, @lettuce.name, @onion.name, @tomato.name])
    end
  end

  describe 'popular_ingredients' do
    it 'shows three top popular ingredients used by chef' do
      expect(@gordon.popular_ingredients).to match_array([@tomato, @bread, @onion])
    end
  end
end