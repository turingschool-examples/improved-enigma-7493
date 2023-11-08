require 'rails_helper'

RSpec.describe Dish, type: :model do
  before :each do
    @chef1 = Chef.create(name: "Ratatouille")
    @dish1 = @chef1.dishes.create(name: "Pasta", description: "Yummys")

    @ingredient1 = Ingredient.create(name: "Cheese", calorie: 20)
    @ingredient2 = Ingredient.create(name: "Pasta", calorie: 10)
    @ingredient3 = Ingredient.create(name: "Sauce", calorie: 5)

    @dish1.ingredients << @ingredient1
    @dish1.ingredients << @ingredient2
    @dish1.ingredients << @ingredient3
  end

  describe "validations" do
      it {should validate_presence_of :name}
      it {should validate_presence_of :description}
  end

  describe "relationships" do
      it {should belong_to :chef}
      it {should have_many(:dish_ingredients)}
      it {should have_many(:ingredients).through(:dish_ingredients)}
  end

  describe "instance_methods" do
    describe "#total_calories" do
      it "can sum the total calories in a dish" do
        expect(@dish1.total_calories).to eq(35)
      end
    end
  end
end