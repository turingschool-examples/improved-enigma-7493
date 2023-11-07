require "rails_helper"

RSpec.describe Dish, type: :feature do
  before :each do
    @chef1 = Chef.create!(name: "Bobby Flay")
    @chef2 = Chef.create!(name: "Jiro")
    @dish1 = @chef1.dishes.create!(name: "Dish 1", description: "aaaaa")
    @dish2 = @chef1.dishes.create!(name: "Dish 2", description: "bbbbb")
    @dish3 = @chef2.dishes.create!(name: "Dish 3", description: "ccccc")
    @ingredient1 = @dish1.ingredients.create!(name: "Ingredient 1", calories: 1)
    @ingredient2 = @dish1.ingredients.create!(name: "Ingredient 2", calories: 2)
    @ingredient3 = @dish1.ingredients.create!(name: "Ingredient 3", calories: 3)
    @ingredient4 = @dish2.ingredients.create!(name: "Ingredient 4", calories: 4)
    @ingredient5 = @dish2.ingredients.create!(name: "Ingredient 5", calories: 5)
    @ingredient6 = @dish3.ingredients.create!(name: "Ingredient 6", calories: 7)
  end


  describe "As a visitor, when I visit the dish's show page" do
    it "I see the dish's name and description" do
      visit "/dishes/#{@dish1.id}"
      
      expect(page).to have_content("Dish 1")
      expect(page).to have_content("aaaaa")
      
      visit "/dishes/#{@dish3.id}"
      expect(page).to have_content("Dish 3")
      expect(page).to have_content("ccccc")

    end
    
    it "And I see a list of ingredients for that dish" do
      visit "/dishes/#{@dish1.id}"
      expect(page).to have_content("Ingredient List:")
      expect(page).to have_content("Ingredient 1")
      expect(page).to have_content("Ingredient 2")
      expect(page).to have_content("Ingredient 3")
      
      visit "/dishes/#{@dish3.id}"
      expect(page).to have_content("Ingredient List:")
      expect(page).to have_content("Ingredient 6")
    end

    it "And I see a total calorie count for that dish" do
      visit "/dishes/#{@dish1.id}"

      expect(page).to have_content("Calorie Count: 6")
      
      visit "/dishes/#{@dish3.id}"
      expect(page).to have_content("Calorie Count: 7")

    end

    it "And I see the Chef's name" do
      visit "/dishes/#{@dish1.id}"

      expect(page).to have_content("Chef: Bobby Flay")
      
      visit "/dishes/#{@dish3.id}"
      expect(page).to have_content("Chef: Jiro")

    end
  end

  describe "I see a form to add an existing ingredient to this dish" do
    describe "When I fill in the form with the id of a ingredient that already exists in the database and I click submit" do
      it "Then I am redirected back to that dish's show page where I see the ingredient's name now listed" do
        visit "/dishes/#{@dish1.id}"
        expect(page).to_not have_content("Ingredient 4")
        fill_in(:add_ingredient, with: "#{@ingredient4.id}")
        click_button("Add ingredient")
        
        expect(current_path).to eq("/dishes/#{@dish1.id}")
        expect(page).to have_content("Ingredient 4")
        expect(page).to_not have_content("Ingredient 5")
        
        visit "/dishes/#{@dish2.id}"
        expect(page).to_not have_content("Ingredient 1")
        fill_in(:add_ingredient, with: "#{@Ingredient1.id}")
        click_button("Add ingredient")

        expect(current_path).to eq("/dishes/#{@dish2.id}")
        expect(page).to have_content("Ingredient 4")
        expect(page).to_not have_content("Ingredient 6")
        expect(page).to have_content("Ingredient 1")
      end
    end
  end
end
