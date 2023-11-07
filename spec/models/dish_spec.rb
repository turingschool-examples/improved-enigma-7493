require 'rails_helper'

RSpec.describe Dish, type: :model do
  before :each do
    test_data
  end

  describe "validations" do
      it {should validate_presence_of :name}
      it {should validate_presence_of :description}
  end

  describe "relationships" do
      it {should belong_to :chef}
  end

  describe "#calories_total" do
    it "can print the total calories in a dish" do
      expect(@dish2.calories_total).to eq(415)
    end
  end

  describe "#calories_total" do
    it "can put the ingredients in printable form" do
      ingredients = @dish.ingredients.map{|i| i.name}.join(", ").to_s
      expect(@dish.print_ingredients).to eq(ingredients)
    end
  end

end