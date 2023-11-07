require 'rails_helper'

RSpec.describe Chef, type: :model do

  describe "validations" do
      it {should validate_presence_of :name}
  end

  describe "relationships" do
      it {should have_many :dishes}
      it {should have_many(:dish_ingredients).through(:dishes) }
      it {should have_many(:ingredients).through(:dish_ingredients) }

  end

  describe "top_three_ingredients" do
    it "Returns the to three ingredients the chef uses in their dishes" do
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
      @dish4 = @chef1.dishes.create!(name: "Dish 4", description: "aaaaa")
      @dish5 = @chef1.dishes.create!(name: "Dish 5", description: "bbbbb")
      @dish6 = @chef1.dishes.create!(name: "Dish 6", description: "bbbbb")
      @dish4.ingredients << @ingredient1
      @dish4.ingredients << @ingredient2
      @dish4.ingredients << @ingredient3
      @dish5.ingredients << @ingredient1
      @dish5.ingredients << @ingredient2
      @dish6.ingredients << @ingredient2

      expect(@chef1.top_three_ingredients).to eq([@ingredient2, @ingredient1, @ingredient3])
    end
  end

end