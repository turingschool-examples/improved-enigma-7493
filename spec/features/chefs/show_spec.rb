require 'rails_helper'

RSpec.describe "Chef show page" do
  before do
    @chef = Chef.create(name: "Gordon Ramsay")
  end

  it "displays the chef's name" do
    visit "/chefs/#{@chef.id}"
    expect(page).to have_content("Gordon Ramsay")
  end

  it "has a link to view the chef's ingredients" do
    visit "/chefs/#{@chef.id}"
    expect(page).to have_link("View Ingredients")
  end
end