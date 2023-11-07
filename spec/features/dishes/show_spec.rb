require "rails_helper"

RSpec.describe "Dishes Show" do
  before(:each) do
    test_data
  end

  describe '#USER STORY 1/3' do
    it 'when visiting the dish show page, the dish name and description appear' do
      visit "/dishes"
      Dish.all.each do |dish|
        expect(page).to have_content(dish.name)
        expect(page).to have_content(dish.description)
        expect(page).to have_content(dish.name)
        dish.ingredients.each do |i|
          expect(page).to have_content(i.name)
        end
        expect(page).to have_content(dish.name)
      end
    end
  end

end