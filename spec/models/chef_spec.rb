require 'rails_helper'

RSpec.describe Chef, type: :model do

  describe "validations" do
      it {should validate_presence_of :name}
  end

  describe "relationships" do
      it {should have_many :dishes}
  end

  describe '#instance methods' do
    before(:each) do
      @chef_1 = Chef.create!(name: "Sam")
      @chef_2 = Chef.create!(name: "Max")

      @dish_1 = Dish.create!(name: "Vegetable Soup", description: "It has veggies", chef: @chef_1)
      @dish_2 = Dish.create!(name: "Spaghetti", description: "It is yummy", chef: @chef_1)
      @dish_3 = Dish.create!(name: "Steak", description: "It is meat", chef: @chef_2)

      @ingredient_1 = Ingredient.create!(name: "Carrot", calories: 50)
      @ingredient_2 = Ingredient.create!(name: "Celery", calories: 10)
      @ingredient_3 = Ingredient.create!(name: "Onion", calories: 30)
      @ingredient_4 = Ingredient.create!(name: "Pasta", calories: 200)
      @ingredient_5 = Ingredient.create!(name: "Beef", calories: 50)
      # Will see these ingredients, unique list
      @dish_1.ingredients << @ingredient_1
      @dish_1.ingredients << @ingredient_2
      @dish_1.ingredients << @ingredient_3
      @dish_2.ingredients << @ingredient_3
      @dish_2.ingredients << @ingredient_4
      # Will not see this ingredient
      @dish_3.ingredients << @ingredient_5
    end

    describe '#unique_ingredients_used' do
      it 'returns unique list of ingredients used by a chef' do
        expect(@chef_1.unique_ingredients_used).to eq([@ingredient_1, @ingredient_2, @ingredient_3, @ingredient_4])
        expect(@chef_2.unique_ingredients_used).to eq([@ingredient_5])
      end
    end

    describe '#top_three_ingredients' do
      it 'returns top three ingredients' do
        @dish_1.ingredients << @ingredient_3
        @dish_2.ingredients << @ingredient_1
        @dish_2.ingredients << @ingredient_2

        expect(@chef_1.top_three_ingredients).to eq[@ingredient_1, @ingredient_2 ,@ingredient_3]
      end
    end
  end
end