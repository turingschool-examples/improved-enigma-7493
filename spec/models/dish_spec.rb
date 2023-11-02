require "rails_helper"

RSpec.describe Dish, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
  end

  describe "relationships" do
    it { should belong_to :chef }
  end

  before(:each) do
    @chef = Chef.create!(name: Faker::Name)
    @dish = @chef.dishes.create!(
      name: "Meatballs Marinara",
      description: Faker::Food.description
    )
    @ground_beef = Ingredient.create!(name: "ground beef", calories: 900)
    @marinara = Ingredient.create!(name: "marinara", calories: 85)
    DishIngredient.create!(dish_id: @dish.id, ingredient_id: @ground_beef.id)
    DishIngredient.create!(dish_id: @dish.id, ingredient_id: @marinara.id)
  end

  describe "instance methods" do
    describe "#calories" do
      it "sums all the calories in the ingredients list" do
        expect(@dish.calories).to eq 985
      end
    end
  end
end
