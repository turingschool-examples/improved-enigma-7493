require 'rails_helper'

RSpec.describe 'Dish show page' do
  before(:each) do
    @chef = Chef.create(name: 'Gordon Ramsay')
    @dish = @chef.dishes.create(name: 'Beef Wellington', description: 'A classic British dish')
    @ingredient_1 = Ingredient.create(name: 'Beef', calories: 200)
    @ingredient_2 = Ingredient.create(name: 'Pastry', calories: 100)
    @dish.ingredients << [@ingredient_1, @ingredient_2]
  end

  it 'displays the dish name and description' do
    visit "/dishes/#{@dish.id}"

    expect(page).to have_content(@dish.name)
    expect(page).to have_content(@dish.description)
  end

  it 'displays a list of ingredients for that dish' do
    visit "/dishes/#{@dish.id}"

    expect(page).to have_content(@ingredient_1.name)
    expect(page).to have_content(@ingredient_2.name)
  end

  it 'displays the total calorie count for that dish' do
    visit "/dishes/#{@dish.id}"

    expect(page).to have_content(@dish.total_calories)
  end

  it 'displays the chef name' do
    visit "/dishes/#{@dish.id}"

    expect(page).to have_content(@chef.name)
  end
end