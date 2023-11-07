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

  describe "As a visitor, when I visit a chef's show page" do
    describe "I see a link to view a list of all ingredients  that this chef uses in their dishes" do
      it "When I click on that link I'm taken to a chef's ingredients index page and I can see a unique list of names of all the ingredients that this chef uses." do
        visit "/chefs/#{@chef1.id}"
        click_link("All ingredients used by chef")
        expect(current_path).to eq("/chefs/#{@chef1.id}/ingredients")
        expect(page).to have_content("Ingredient 1")
        expect(page).to have_content("Ingredient 2")
        expect(page).to have_content("Ingredient 3")

        visit "/chefs/#{@chef3.id}"
        click_link("All ingredients used by chef")
        expect(current_path).to eq("/chefs/#{@chef3.id}/ingredients")
        expect(page).to have_content("Ingredient 6")
      end
    end
  end
end