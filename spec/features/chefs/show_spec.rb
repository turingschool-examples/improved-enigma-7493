require 'rails_helper' 

RSpec.describe "Chef Show Page (/dishes/:id)" do 

  before(:each) do 
    load_test_data
  end

  describe "Visiting a Chef's show page" do
    it "has a link that takes me to that chefs ingredients index, containing the names of all the ingredients that cheff uses" do 
      visit "/chefs/#{@chef3.id}"
      expect(page).to have_content("Chef Jacob")
      expect(page).to have_link("Ingredients")
      click_link "Ingredients"
      expect(current_path).to eq("/chefs/#{@chef3.id}/ingredients")
    end
    
  end
end