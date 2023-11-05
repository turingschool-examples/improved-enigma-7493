require 'rails_helper'

RSpec.describe Chef, type: :model do

  describe "validations" do
      it {should validate_presence_of :name}
  end

  describe "relationships" do
      it {should have_many :dishes}
      it {should have_many(:dish_ingredients).through(:dishes)}
      it {should have_many(:ingredients).through(:dish_ingredients)}
  end

  before :each do
    @chef_1 = Chef.create!(name: "Matty Matheson")
    @dish_1 = @chef_1.dishes.create!(name: "ribs", description: "tasty messy ribs")
    @ingredient_1 = @dish_1.ingredients.create!(name: "raw ribs", calories: 1000)
    @ingredient_2 = @dish_1.ingredients.create!(name: "bbq sauce", calories: 500)
    @ingredient_3 = @dish_1.ingredients.create!(name: "ranch", calories: 500)
    @ingredient_4 = Ingredient.create!(name: "beans", calories: 500)
    @ingredient_5 = @dish_1.ingredients.create!(name: "ranch", calories: 500)
  end

  describe "instance methods" do
    describe "#list_ingredients" do
      it "returns a unique list of ingredients for a chef" do
        expect(@chef_1.list_ingredients).to eq("bbq sauce, ranch, and raw ribs")
      end
    end
  end
end