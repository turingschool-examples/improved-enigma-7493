require "rails_helper"

RSpec.describe Chef, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
  end

  describe "relationships" do
    it { should have_many :dishes }
  end

  before(:each) do
    @chef = Chef.create!(name: Faker::Name.name)
    @dish = @chef.dishes.create!(
      name: "Meatballs Marinara",
      description: Faker::Food.description
    )
    @ground_beef = Ingredient.create!(name: "ground beef", calories: 900)
    @marinara = Ingredient.create!(name: "marinara", calories: 85)
    @parmesan = Ingredient.create!(name: "parmesan", calories: 65)
    DishIngredient.create!(dish_id: @dish.id, ingredient_id: @ground_beef.id)
    DishIngredient.create!(dish_id: @dish.id, ingredient_id: @marinara.id)
  end

  describe "instance methods" do
    describe "#ingredients" do
      it "returns a list of all ingredients used by chef" do
        expect(@chef.ingredients).to match_array [@ground_beef, @marinara]
      end
    end
  end
end
