require 'rails_helper'

RSpec.describe 'Chefs Show Page', type: :feature do
  before (:each) do 
    @chef1 = Chef.create(name: "Miranda Delaney")
    @chef2 = Chef.create(name: "John Doe")

    @dish1 = @chef1.dishes.create(name: "Spaghetti", description: "vegetarian")
    @dish2 = @chef2.dishes.create(name: "Lasagna", description: "gluten free")
    @dish3 = @chef1.dishes.create(name: "Salad", description: "healthy")

    @ingredient1 = @dish1.ingredients.create(name: "penne noodle", calories: 150)
    @ingredient2 = @dish1.ingredients.create(name: "sauce", calories: 300)
    @ingredient3 = @dish1.ingredients.create(name: "veggie meat", calories: 100)

    @ingredient4 = @dish2.ingredients.create(name: "gf noodle", calories: 200)
    @ingredient5 = @dish2.ingredients.create(name: "sauce", calories: 200)
    @ingredient6 = @dish2.ingredients.create(name: "meat", calories: 100)

    @ingredient7 = @dish3.ingredients.create(name: "spinach", calories: 100)
    @ingredient8 = @dish3.ingredients.create(name: "tomatoes", calories: 100)
    @ingredient9 = @dish3.ingredients.create(name: "feta", calories: 200)
    @ingredient10 = @dish3.ingredients.create(name: "balsamic vinaigrette", calories: 250)
  end

  describe "When I visit a chef's show page" do
    describe "I see a link to view a list of all ingredients that this chef uses in their dishes" do
      it 'When I click on that link
        Im taken to a chefs ingredients index page
        and I can see a unique list of names of all the ingredients that this chef uses.' do
        visit "chefs/#{@chef1.id}"

        expect(page).to have_content("Ingredients List")
        click_link("Ingredients List")
        expect(current_path).to eq("/chefs/#{@chef1.id}/ingredients")
        expect(page).to have_content("penne noodle")
        expect(page).to have_content("sauce")
        expect(page).to have_content("veggie meat")
        expect(page).to have_content("spinach")
        expect(page).to have_content("tomatoes")
        expect(page).to have_content("feta")
        expect(page).to have_content("balsamic vinaigrette")

        visit "chefs/#{@chef2.id}"

        expect(page).to have_content("Ingredients List")
        click_link("Ingredients List")
        expect(current_path).to eq("/chefs/#{@chef2.id}/ingredients")
        expect(page).to have_content("gf noodle")
        expect(page).to have_content("sauce")
        expect(page).to have_content("meat")
      end
    end
  end
end