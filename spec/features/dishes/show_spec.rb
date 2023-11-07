require "rails_helper"

RSpec.describe "Dishes Show" do
  before(:each) do
    test_data
  end

  describe '#USER STORY 1/3' do
    it 'when visiting the dish show page, the dish name and description appear' do
      visit "/dishes/#{@dish2.id}"
      expect(page).to have_content(@dish2.name)
      expect(page).to have_content(@dish2.description)
      expect(page).to have_content(@dish2.name)
      @dish2.ingredients.each do |i|
        expect(page).to have_content(i.name)
      end
    end
  end

  describe '#USER STORY 2/3' do
    it 'when visiting the dish show page, there is a form to add an existing ingredient to that dish' do
      visit "/dishes/#{@dish2.id}"
      fill_in "Add Another Ingredient", with: "#{@blackberries.id}"
      click_button "Submit"
      expect(current_path).to eq("/dishes/#{@dish2.id}")
      expect(page).to have_content("Blackberries")
    end
  end

  describe '#USER STORY 3/3' do
    it 'when visiting the dish show page, there is a link to view all ingredients this chef uses in their dishes' do
      visit "/dishes/#{@dish2.id}"
      click_link "Lauren"
      expect(current_path).to eq("/chefs/#{@cheflauren.id}")
      click_link "List of Ingredients Used"
      expect(current_path).to eq("/chefs/#{@cheflauren.id}/ingredients")
    end

    it "at the chef ingredients index, lists the names of all dishes" do
      visit "/chefs/#{@cheflauren.id}/ingredients"
      @cheflauren.ingredients.each do |i|
        expect(page).to have_content(i.name)
      end
    end
  end

end