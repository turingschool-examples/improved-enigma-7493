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
      expect(page).to have_content("Ingredients: Pasta Cheese")
      expect(page).to have_content("Total Calories: 775")
      expect(page).to have_content("Chef Peter")
    end

    it "has a form to add an existing Ingredient to the Dish, that redirects back to the Dish show page." do 
      visit "/dishes/#{@dish1.id}"
      within "#add_ingredients" do
        expect(page).to have_field(:ingredient_id)
        fill_in :ingredient_id, with: @ingredient9.id
        click_button "Submit"
      end
      expect(current_path).to eq("/dishes/#{@dish1.id}")
      expect(page).to have_content("Ingredients: Pasta Cheese Milk")
    end
  end
end 