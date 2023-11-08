require 'rails_helper'

RSpec.describe 'Ingredients index page', type: :feature do
  before do
    @chef = Chef.create!(name: 'Gordon Ramsay')
    @dish = @chef.dishes.create(name: 'Beef Stew')
    @ingredient1 = Ingredient.create(name: 'Beef')
    @ingredient2 = Ingredient.create(name: 'Potatoes')
    @ingredient3 = Ingredient.create(name: 'Carrots')
    @dish.ingredients << [@ingredient1, @ingredient2, @ingredient3]
  end

  it 'displays the chef name and ingredients list' do
    visit "/chefs/#{@chef.id}/ingredients" 
    save_and_open_page
    expect(page).to have_content("Ingredients Used by #{@chef.name}")
    expect(page).to have_content(@ingredient1.name)
    expect(page).to have_content(@ingredient2.name)
    expect(page).to have_content(@ingredient3.name)
  end
end
