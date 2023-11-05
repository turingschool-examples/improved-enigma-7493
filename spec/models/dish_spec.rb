require 'rails_helper'

RSpec.describe Dish, type: :model do

  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end

  describe "relationships" do
    it {should belong_to :chef}
  end

  before :each do
    @chef_1 = Chef.create!(name: "Matty Matheson")
    @dish_1 = @chef_1.dishes.create!(name: "ribs", description: "tasty messy ribs")
    @ingredient_1 = @dish_1.ingredients.create!(name: "raw ribs", calories: 1000)
    @ingredient_2 = @dish_1.ingredients.create!(name: "bbq sauce", calories: 500)
  end

  describe "instance methods" do
    describe "#list_ingredients" do
      it "returns a list of ingredients for a particular dish" do
        expect(@dish_1.list_ingredients).to eq("raw ribs and bbq sauce")
      end
    end

    describe "#total_calories" do
      it "returns a sum of the calories of the ingredients for a dish" do
        expect(@dish_1.total_calories).to eq(1500)
      end
    end
  end
end