require 'rails_helper'

RSpec.describe Dish, type: :model do

  describe "validations" do
      it {should validate_presence_of :name}
      it {should validate_presence_of :description}
  end

  describe "relationships" do
      it {should belong_to :chef}
      it {should have_many :dish_ingredients}
  end
  
  describe "#calories" do
    it "totals the number of calories of ingredients in the dish" do
      @chef1 = Chef.create(name: "Kam")
      @dish1 = @chef1.dishes.create(name: "cereal au lait", description: "lucky charms in a whole milk reduction")
      @milk = Ingredient.create(name: "whole milk", calories: 500)
      @cereal = Ingredient.create(name: "lucky charms", calories: 400)
      @dish1.ingredients << @milk
      @dish1.ingredients << @cereal
      expect(@dish1.calories).to eq(900)
    end
  end
end