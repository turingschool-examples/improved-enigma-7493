require "rails_helper"

RSpec.describe Chef, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
  end

  describe "relationships" do
    it { should have_many :dishes }
  end

  describe "#unique_ingredients" do
    it "sums up the calories for a dish" do
      @chef_1 = Chef.create!(name: "Naruto")
      @dish_1 = @chef_1.dishes.create!(name: "Ramen", description: "delicious ichiraku ramen cooked fresh", chef_id: @chef_1.id)
      @dish_2 = @chef_1.dishes.create!(name: "Hibachi", description: "banging friend rice", chef_id: @chef_1.id)
      @ingredient_1 = Ingredient.create!(name: "Tonkatsu", calories: 7)
      @ingredient_2 = Ingredient.create!(name: "Udon Noodle", calories: 21)
      @ingredient_3 = Ingredient.create!(name: "Steak", calories: 49)
      @ingredient_4 = Ingredient.create!(name: "Fried Rice", calories: 77)

      DishIngredient.create(dish_id: @dish_1.id, ingredient_id: @ingredient_1.id)
      DishIngredient.create(dish_id: @dish_1.id, ingredient_id: @ingredient_2.id)
      DishIngredient.create(dish_id: @dish_1.id, ingredient_id: @ingredient_3.id)
      DishIngredient.create(dish_id: @dish_2.id, ingredient_id: @ingredient_3.id)
      DishIngredient.create(dish_id: @dish_2.id, ingredient_id: @ingredient_4.id)

      expect(@chef_1.unique_ingredients).to eq([@ingredient_1, @ingredient_2, @ingredient_3, @ingredient_4])
    end
  end
end
