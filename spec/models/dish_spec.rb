require 'rails_helper'

RSpec.describe Dish, type: :model do

  describe "validations" do
      it {should validate_presence_of :name}
      it {should validate_presence_of :description}
  end

  describe "relationships" do
      it {should belong_to :chef}
  end

  describe "#total_calories" do 
    it "calculates a dishes total calories" do 
      @flay = Chef.create!(name: "Bobby Flay")
      @ramen = Dish.create!(name: "Ramen", description: "A really good soup dish", chef_id: @flay.id)
      @noodles = Ingredient.create!(name: "Ramen noodles", calories: 10)
      @broth = Ingredient.create!(name: "Vegetable broth", calories: 15)
      DishIngredient.create!(dish_id: @ramen.id, ingredient_id: @noodles.id)
      DishIngredient.create!(dish_id: @ramen.id, ingredient_id: @broth.id)

      expect(@ramen.total_calories).to eq(25)
    end
  end
end