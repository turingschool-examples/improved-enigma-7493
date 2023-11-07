RSpec.describe Ingredient, type: :model do
  
  before(:each) do 
    load_test_data
  end
  
  describe "validations" do
      it {should validate_presence_of :name}
      it {should validate_presence_of :calories}
  end

  describe "relationships" do
      it {should have_many :dish_ingredients} 
      it {should have_many :dishes}
  end

end