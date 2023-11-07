require 'rails_helper'

RSpec.describe Dish, type: :model do
  
  before(:each) do 
    load_test_data
  end
  
  describe "validations" do
      it {should validate_presence_of :name}
      it {should validate_presence_of :description}
  end

  describe "relationships" do
      it {should belong_to :chef}
      it {should have_many :dish_ingredients} 
      it {should have_many :ingredients}
  end

  describe "Instance Methods" do 
    describe "#total_calories" do 
      it "finds the sum of all calories for all ingredients belonging to a dish" do 
        expect(@dish1.total_calories).to eq(775)
      end
    end
  end

end