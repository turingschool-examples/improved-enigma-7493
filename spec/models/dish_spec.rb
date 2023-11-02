require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
      it {should validate_presence_of :name}
      it {should validate_presence_of :description}
  end

  describe "relationships" do
      it {should belong_to :chef}
      it {should have_many :dish_ingredients}
      it {should have_many(:ingredients).through(:dish_ingredients)}
  end

  before :each do
    @shawn = Chef.create!(name: "Shawn")
    @chili = Dish.create!(name: "Chili", description: "spicy", chef_id: @shawn.id)
    @pasta = Dish.create!(name: "Pasta", description: "tasty", chef_id: @shawn.id)
    @ingredient1 = @chili.ingredients.create!(name: "Black Beans", calories: 20)
    @ingredient2 = @chili.ingredients.create!(name: "Pinto Beans", calories: 20)
    @ingredient3 = @chili.ingredients.create!(name: "Quinoa", calories: 30)
    @tomato = Ingredient.create!(name: "Tomato Sauce", calories: 10)
  end

  describe "#methods" do
    describe "#total_calories" do
      it "can provide total calories for a dish" do
        expect(@chili.total_calories).to eq(70)
      end
    end

    describe "#chef_name" do
      it "can provide the chef's name for a dish" do
        expect(@chili.chef_name).to eq("Shawn")
      end
    end

    describe "#add_ingredient" do 
      it "can add an ingredient to ingredient list" do
        expect(@chili.ingredients).to eq([@ingredient1, @ingredient2, @ingredient3])
        
        @chili.add_ingredient(@tomato)
        
        expect(@chili.ingredients).to eq([@ingredient1, @ingredient2, @ingredient3, @tomato])
      end
    end
  end
end