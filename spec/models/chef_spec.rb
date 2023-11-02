require 'rails_helper'

RSpec.describe Chef, type: :model do

  describe "validations" do
      it {should validate_presence_of :name}
  end

  describe "relationships" do
      it {should have_many :dishes}
      it {should have_many(:ingredients).through(:dishes)}
  end

  describe "#methods" do
    before :each do
      @shawn = Chef.create!(name: "Shawn")
      @chili = Dish.create!(name: "Chili", description: "spicy", chef_id: @shawn.id)
      @pasta = Dish.create!(name: "Pasta", description: "tasty", chef_id: @shawn.id)
      @ingredient1 = @chili.ingredients.create!(name: "Black Beans", calories: 20)
      @ingredient2 = @chili.ingredients.create!(name: "Pinto Beans", calories: 20)
      @ingredient3 = @chili.ingredients.create!(name: "Quinoa", calories: 30)
      @tomato = Ingredient.create!(name: "Tomato Sauce", calories: 10)
      @chili.add_ingredient(@tomato)
      @pasta.add_ingredient(@tomato)
      @pasta.add_ingredient(@ingredient1)
    end

    describe "#unique_ingredients" do
      it "can provide a unique list of ingredients used by a chef" do
        expect(@shawn.unique_ingredients).to eq([@ingredient1, @ingredient2, @ingredient3, @tomato])
      end
    end
  end
end