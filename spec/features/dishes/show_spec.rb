require 'rails_helper' 

RSpec.describe "Dish Show Page (/dishes/:id)" do 

  before(:each) do 
    load_test_data
  end

  describe "Visiting the Dish show page" do 
    it "displays the Dish's name and description, a list of ingredients, total calories, and the chefs name" do 
      visit "/dishes/#{@dish1.id}"
      expect(page).to have_content("Mac-n-Cheese")
      expect(page).to have_content("Elbow pasta served in a creamy cheese sauce")
      expect(page).to have_content("Ingredients: Pasta, Cheese")
      expect(page).to have_content("Total Calories: 775")
      expect(page).to have_content("Chef Peter")
    end
  end
end 