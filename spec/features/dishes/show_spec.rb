require "rails_helper"

RSpec.describe "the dishes show page" do
  before :each do
    @chef_1 = Chef.create!(name: "Matty Matheson")
    @dish_1 = @chef_1.dishes.create!(name: "ribs", description: "tasty messy ribs")
    @ingredient_1 = @dish_1.ingredients.create!(name: "raw ribs", calories: 1000)
  end

  it "shows the dish's name, description, and ingredients" do
    visit dish_path(@dish_1)

    expect(page).to have_content(@dish_1.name)
    expect(page).to have_content(@dish_1.description)
    expect(page).to have_content(@dish_1.description)
  end

  it "shows the dish's total calorie count and shef name" do
    visit dish_path(@dish_1)


  end
end