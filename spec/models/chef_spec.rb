require 'rails_helper'

RSpec.describe Chef, type: :model do
  before :each do
    @chef1 = Chef.create(name: "Ratatouille")
    @dish1 = @chef1.dishes.create(name: "Pasta", description: "Yummys")
    @dish2 = @chef1.dishes.create(name: "Sushi", description: "Yummers")

    @ingredient1 = Ingredient.create(name: "Cheese", calorie: 20)
    @ingredient2 = Ingredient.create(name: "Pasta", calorie: 10)
    @ingredient3 = Ingredient.create(name: "Sauce", calorie: 5)

    @ingredient4 = Ingredient.create(name: "Salmon", calorie: 2)
    @ingredient5 = Ingredient.create(name: "Tuna", calorie: 3)
    @ingredient6 = Ingredient.create(name: "Cheese", calorie: 20)

    @dish1.ingredients << @ingredient1
    @dish1.ingredients << @ingredient2
    @dish1.ingredients << @ingredient3

    @dish2.ingredients << @ingredient4
    @dish2.ingredients << @ingredient5
    @dish2.ingredients << @ingredient6
  end

  describe "validations" do
      it {should validate_presence_of :name}
  end

  describe "relationships" do
      it {should have_many :dishes}
  end

  describe "instance_methods" do
    describe "#all_ingredients" do
      it "can find all unique ingredients for all dishes" do
        expected_ingredients = [@ingredient1.name, @ingredient2.name, @ingredient3.name, @ingredient4.name, @ingredient5.name].sort
        expect(@chef1.all_ingredients.sort).to eq(expected_ingredients)
        expect(@chef1.all_ingredients.length).to eq(5)
      end
    end
  end
end