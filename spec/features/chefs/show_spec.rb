require "rails_helper"

RSpec.describe "chef show", type: :feature do
  describe 'When a user visits a chef show page, there is a link to chefs ingredients index' do
    before(:each) do
      @chef_1 = Chef.create!(name: "Sam")

      visit chef_path(@chef_1)
    end
    it 'They see a link, click it, and are taken to a chefs ingredients index page' do
      expect(page).to have_selector(:link_or_button, "Chef Ingredients")

      click_link("Chef Ingredients")

      expect(current_path).to eq(chef_ingredients_path(@chef_1))
    end

  end

end

# As a visitor
# When I visit a chef's show page
# I see a link to view a list of all ingredients that this chef uses in their dishes.
# When I click on that link
# I'm taken to a chef's ingredients index page
# and I can see a unique list of names of all the ingredients that this chef uses.