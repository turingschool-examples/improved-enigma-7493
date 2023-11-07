require 'rails_helper'

RSpec.describe DishIngredient, type: :model do
  
  before(:each) do 
    load_test_data
  end
  
  describe "relationships" do
      it {should belong_to :dish}
      it {should belong_to :ingredient}
  end

end