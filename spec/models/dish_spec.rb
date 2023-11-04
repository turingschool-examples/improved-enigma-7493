require "rails_helper"

RSpec.describe Dish, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
  end

  describe "relationships" do
    it { should belong_to :chef }
    it { should have_many :dish_ingredients }
    it { should have_many(:ingredients).through(:dish_ingredients) }
  end

  describe "#total_calories" do
    it "sums up the calories for a dish" do
      @chef_1 = Chef.create!(name: "Naruto")
      @dish_1 = @chef_1.dishes.create!(name: "Ramen", description: "delicious ichiraku ramen cooked fresh", chef_id: @chef_1.id)
      @ingredient_1 = Ingredient.create!(name: "Tonkatsu", calories: 7)
      @ingredient_2 = Ingredient.create!(name: "Udon Noodle", calories: 21)
      @ingredient_3 = Ingredient.create!(name: "Bone Broth", calories: 49)
      @dish_ingredient_1 = DishIngredient.create(dish: @dish_1, ingredient: @ingredient_1)
      @dish_ingredient_2 = DishIngredient.create(dish: @dish_1, ingredient: @ingredient_2)
      @dish_ingredient_3 = DishIngredient.create(dish: @dish_1, ingredient: @ingredient_3)

      expect(@dish_1.total_calories).to eq(77)
    end
  end
end
