require "rails_helper"

RSpec.describe "Chefs Show" do
  before(:each) do
    test_data
  end

  describe "#EXTENSION 2/2" do
    it "when visiting chef show page, it shows the top three most popular ingredients the chef uses" do
      visit "/chefs/#{@cheflauren.id}"
      expect(page).to have_content("Top 3 Most Popular Ingredients:")
      expect(@sugar.name).to appear_before(@vanillabean.name)
      expect(@vanillabean.name).to appear_before(@eggyolks.name)
    end
  end
end