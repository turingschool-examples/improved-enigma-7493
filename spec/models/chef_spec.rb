require 'rails_helper'

RSpec.describe Chef, type: :model do
  
  before(:each) do 
    load_test_data
  end

  describe "validations" do
    it {should validate_presence_of :name}
  end

  describe "relationships" do
    it {should have_many :dishes}
  end

  describe "instance methods" do 
    describe "#chef_ingredients" do 
      it "returns the names of each ingredient used in the Chef's dishes" do 
        expect(@chef1.chef_ingredients.sort).to eq(["Beef", "Cheese", "Chicken", "Flour", "Pasta"])
      end
    end
  end
end