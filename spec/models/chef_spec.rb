require 'rails_helper'

RSpec.describe Chef, type: :model do

  describe "validations" do
      it {should validate_presence_of :name}
  end

  describe "relationships" do
      it {should have_many :dishes}
  end

  describe "#ingredients_used" do
    it "lists all the ingredients a chef uses" do
      @chef1 = Chef.create(name: "Kam")
      @dish1 = @chef1.dishes.create(name: "cereal au lait", description: "lucky charms in a whole milk reduction")
      @milk = Ingredient.create(name: "whole milk", calories: 500)
      @cereal = Ingredient.create(name: "lucky charms", calories: 400)
      @extra_sugar = Ingredient.create(name: "extra sugar", calories: 20000)
      @dish1.ingredients << @milk
      @dish1.ingredients << @cereal

      expect(@chef1.ingredients_used).to include(@cereal, @milk)
    end
  end
end
