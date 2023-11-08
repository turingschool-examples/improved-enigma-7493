require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
  end

  describe "relationships" do
    it { should belong_to :chef }
    it { should have_many :dish_ingredients }
    it { should have_many(:ingredients).through(:dish_ingredients) }
  end

  describe "#total_calories" do
    let(:chef) { Chef.create(name: "Gordon Ramsay") }
    let(:dish) { Dish.create(name: "Beef Wellington", description: "A classic dish", chef: chef) }
    let(:ingredient1) { Ingredient.create(name: "Beef", calories: 500) }
    let(:ingredient2) { Ingredient.create(name: "Puff Pastry", calories: 300) }
    let(:dish_ingredient1) { DishIngredient.create(dish: dish, ingredient: ingredient1) }
    let(:dish_ingredient2) { DishIngredient.create(dish: dish, ingredient: ingredient2) }

    it "returns the total calories of all ingredients in the dish" do
      dish_ingredient1
      dish_ingredient2
      expect(dish.total_calories).to eq(800)
    end
  end
end