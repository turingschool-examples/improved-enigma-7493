require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
      it {should validate_presence_of :name}
      it {should validate_presence_of :description}
  end

  describe "relationships" do
      it {should belong_to :chef}
      it {should have_many(:dish_ingredients)}
      it {should have_many(:ingredients).through(:dish_ingredients)}
  end

  describe "instance methods" do
    before(:each) do
      @chef1 = Chef.create!(name: "Gordon Ramsey")
      
      @dish1 = @chef1.dishes.create!(name: "Chicken Pot Pie", description: "Mom's recipe")
  
      @ingredient1 = Ingredient.create!(name: "Chicken", kcal: 200)
      @ingredient2 = Ingredient.create!(name: "Milk", kcal: 60)
      @ingredient3 = Ingredient.create!(name: "Flour", kcal: 30)

      @dish_ingredient_1 = DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @ingredient1.id)
      @dish_ingredient_2 = DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @ingredient2.id)
      @dish_ingredient_3 = DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @ingredient3.id)
    end

    it "#kcal_sum" do
      expect(@dish1.ingredients).to eq([@ingredient1, @ingredient2, @ingredient3])
      expect(@dish1.kcal_sum).to eq(290)
    end
  end
end