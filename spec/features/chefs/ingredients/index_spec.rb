require 'rails_helper' 

RSpec.describe "Chef Ingredients Index (/chefs/:chef_id/ingredients)" do 

  before(:each) do 
    load_test_data
  end

  describe "Visiting a Chef's show page" do
    it "has a link that takes me to that chefs ingredients index, containing the names of all the ingredients that cheff uses" do 
      visit "/chefs/#{@chef3.id}/ingredients"
      expect(page).to have_content("Chef Jacob's Ingredients")
      expect(page).to have_content("Pasta")
      expect(page).to have_content("Potatoes")
      expect(page).to have_content("Beef")
      expect(page).to have_content("Flour")
      expect(page).to have_content("Cheese")
    end
  end
end