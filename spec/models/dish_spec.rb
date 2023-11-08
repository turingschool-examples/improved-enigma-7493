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

  describe "instance methods" do
    before :each do 
      @chef1 = Chef.create(name: "Frenchie")
      @chef2 = Chef.create(name: "Baker Boy")

      @dish1 = @chef1.dishes.create(name: "Soup", description: "Soupy Soup")
      @dish2 = @chef1.dishes.create(name: "Goupy Goup", description: "Goupy Soupy Soup Goup")

      @ingredient1 = Ingredient.create(name: "Onion", calories: 10)
      @ingredient2 = Ingredient.create(name: "Garlic", calories: 20)
      @ingredient3 = Ingredient.create(name: "Tomato", calories: 30)
      @ingredient4 = Ingredient.create(name: "Noodle", calories: 40)
      @ingredient5 = Ingredient.create(name: "Kisses", calories: 50)
      @ingredient6 = Ingredient.create(name: "Hugs", calories: 60)

      DishIngredient.create(dish_id: @dish1.id, ingredient_id: @ingredient1.id)
      DishIngredient.create(dish_id: @dish1.id, ingredient_id: @ingredient2.id)
      DishIngredient.create(dish_id: @dish1.id, ingredient_id: @ingredient3.id)
      DishIngredient.create(dish_id: @dish1.id, ingredient_id: @ingredient4.id)
      DishIngredient.create(dish_id: @dish2.id, ingredient_id: @ingredient5.id)
      DishIngredient.create(dish_id: @dish2.id, ingredient_id: @ingredient6.id)
    end

    it "counts calories" do
      expect(@dish1.calorie_count).to eq(100)
    end
  end
end