require 'rails_helper'

RSpec.describe 'Dishes Show Page', type: :feature do
  before (:each) do 
    @chef1 = Chef.create(name: "Miranda Delaney")
    @chef2 = Chef.create(name: "John Doe")

    @dish1 = @chef1.dishes.create(name: "Spaghetti", description: "vegetarian")
    @dish2 = @chef2.dishes.create(name: "Lasagna", description: "gluten free")

    @ingredient1 = @dish1.ingredients.create(name: "penne noodle", calories: 150)
    @ingredient2 = @dish1.ingredients.create(name: "sauce", calories: 300)
    @ingredient3 = @dish1.ingredients.create(name: "veggie meat", calories: 100)

    @ingredient4 = @dish2.ingredients.create(name: "gf noodle", calories: 200)
    @ingredient5 = @dish2.ingredients.create(name: "sauce", calories: 200)
    @ingredient6 = @dish2.ingredients.create(name: "meat", calories: 100)
  end

  describe "When I visit a dish's show page" do
    it "I see the dishes name and description and a list of ingredients for that dish" do
      visit "/dishes/#{@dish1.id}"

      expect(page).to have_content("Spaghetti")
      expect(page).to have_content("vegetarian")
      expect(page).to have_content("List of Ingredients:")
      expect(page).to have_content("penne noodle")
      expect(page).to have_content("sauce")
      expect(page).to have_content("veggie meat")

      visit "/dishes/#{@dish2.id}"

      expect(page).to have_content("Lasagna")
      expect(page).to have_content("gluten free")
      expect(page).to have_content("List of Ingredients:")
      expect(page).to have_content("gf noodle")
      expect(page).to have_content("sauce")
      expect(page).to have_content("meat")
    end

    it "And I see a total calorie count for that dish and the chefs name" do
      visit "/dishes/#{@dish1.id}"

      expect(page).to have_content("Calorie Count: 550")
      expect(page).to have_content("Chef: Miranda Delaney")

      visit "/dishes/#{@dish1.id}"

      expect(page).to have_content("Calorie Count: 500")
      expect(page).to have_content("Chef: John Doe")
    end
  end
end