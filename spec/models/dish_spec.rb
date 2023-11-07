require 'rails_helper'

RSpec.describe Dish, type: :model do

  describe "validations" do
      it {should validate_presence_of :name}
      it {should validate_presence_of :description}
  end

  describe "relationships" do
      it {should belong_to :chef}
      it { should have_many :ingredient_dishes }
      it { should have_many(:ingredients).through(:ingredient_dishes) }
  end

  describe '#instance methods' do
  before(:each) do
    @chef_1 = Chef.create!(name: "Sam")

    @dish_1 = Dish.create!(name: "Vegetable Soup", description: "It has veggies", chef: @chef_1)

    @ingredient_1 = Ingredient.create!(name: "Carrot", calories: 50)
    @ingredient_2 = Ingredient.create!(name: "Celery", calories: 10)
    @ingredient_3 = Ingredient.create!(name: "Onion", calories: 30)

    @dish_1.ingredients << @ingredient_1
    @dish_1.ingredients << @ingredient_2
    @dish_1.ingredients << @ingredient_3
  end
    describe '#total_calories' do
      it 'returns sum of calories of a dish' do
        expect(@dish_1.total_calories).to eq(90)
      end
    end
  end
end