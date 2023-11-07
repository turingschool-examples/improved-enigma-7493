require 'rails_helper'

RSpec.describe Dish, type: :model do

  describe "validations" do
      it {should validate_presence_of :name}
      it {should validate_presence_of :description}
  end

  describe "relationships" do
      it {should belong_to :chef}
      it {should have_many :dish_ingredients}
      it {should have_many(:ingredients).through(:dish_ingredients) }
  end
  before :each do
    @chef1 = Chef.create!(name: "Bobby Flay")
    @chef2 = Chef.create!(name: "Jiro")
    @dish1 = @chef1.dishes.create!(name: "Dish 1", description: "aaaaa")
    @dish2 = @chef1.dishes.create!(name: "Dish 2", description: "bbbbb")
    @dish3 = @chef2.dishes.create!(name: "Dish 3", description: "ccccc")
    @ingredient1 = @dish1.ingredients.create!(name: "Ingredient 1", calories: 1)
    @ingredient2 = @dish1.ingredients.create!(name: "Ingredient 2", calories: 2)
    @ingredient3 = @dish1.ingredients.create!(name: "Ingredient 3", calories: 3)
    @ingredient4 = @dish2.ingredients.create!(name: "Ingredient 4", calories: 4)
    @ingredient5 = @dish2.ingredients.create!(name: "Ingredient 5", calories: 5)
    @ingredient6 = @dish3.ingredients.create!(name: "Ingredient 6", calories: 7)
  end

  describe "#calorie_count" do
    it "should return the sum of the calories in all the dish's ingredients" do
      expect(@dish1.calorie_count).to eq(6)
      expect(@dish2.calorie_count).to eq(9)
      expect(@dish3.calorie_count).to eq(7)
      
    end
  end

end