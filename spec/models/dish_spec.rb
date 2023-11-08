require 'rails_helper'

RSpec.describe Dish, type: :model do

  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end

  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many :dish_ingredients}
    it {should have_many(:ingredients).through(:dish_ingredients) }
  end

  describe "#calorie_count" do
    it 'calculates the calories of a dish' do
      @chef1 = Chef.create(name: "Miranda Delaney")
      @chef2 = Chef.create(name: "John Doe")

      @dish1 = @chef1.dishes.create(name: "Spaghetti", description: "vegetarian")
      @dish2 = @chef2.dishes.create(name: "Lasagna", description: "gluten free")

      @ingredient1 = @dish1.ingredients.create(name: "penne noodle", calories: 150)
      @ingredient2 = @dish1.ingredients.create(name: "sauce", calories: 300)
      @ingredient3 = @dish1.ingredients.create(name: "veggie meat", calories: 100)

      @ingredient4 = @dish2.ingredients.create(name: "gf noodle", calories: 200)
      @ingredient5 = @dish2.ingredients.create(name: "sauce", calories: 200)
      @ingredient6 = @dish2.ingredients.create(name: "meat", calories: 100)

      expect(@dish1.calorie_count).to eq(550)
      expect(@dish2.calorie_count).to eq(500)
    end
  end
end