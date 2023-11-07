require "rails_helper"

RSpec.describe "dish show", type: :feature do
  describe 'When a user visits a dish show page, there is information' do
    before(:each) do
      @chef_1 = Chef.create!(name: "Sam")

      @dish_1 = Dish.create!(name: "Vegetable Soup", description: "It has veggies", chef: @chef_1)

      @ingredient_1 = Ingredient.create!(name: "Carrot", calories: 50)
      @ingredient_2 = Ingredient.create!(name: "Celery", calories: 10)
      @ingredient_3 = Ingredient.create!(name: "Onion", calories: 30)

      @dish_1.ingredients << @ingredient_1
      @dish_1.ingredients << @ingredient_2
      @dish_1.ingredients << @ingredient_3

      # visit "/dishes/#{@dish_1.id}"
      visit dish_path(@dish_1)
    end

    it 'They see dishes name and description and chefs name' do
      expect(page).to have_content("Vegetable Soup")
      expect(page).to have_content("Description: It has veggies")
      expect(page).to have_content("Chef: Sam")

    end

    it 'They see a list of ingredients ant total calorie count for that dish' do
      expect(page).to have_content("Ingredients: Carrot Celery Onion")
      expect(page).to have_content("Total Calories: 90")
    end
  end

  describe 'When a user visits the dish show page, they can add an ingredient' do
    before(:each) do
      @chef_1 = Chef.create!(name: "Sam")

      @dish_1 = Dish.create!(name: "Vegetable Soup", description: "It has veggies", chef: @chef_1)

      @ingredient_1 = Ingredient.create!(name: "Carrot", calories: 50)
      @ingredient_2 = Ingredient.create!(name: "Celery", calories: 10)
   
      @dish_1.ingredients << @ingredient_1

      visit dish_path(@dish_1)
    end

    it 'They see a form to add an existing ingredient to that dish' do
      expect(page).to have_selector(:link_or_button, "Submit")
    end

    it 'They fill in the form with ingredient ID, click button, redirects back, sees ingredient added' do
      expect(page).to have_content("Carrot")
      expect(page).to_not have_content("Celery")
      expect(page).to have_content("Total Calories: 50")


      fill_in("Ingredient", with: @ingredient_2.id)
      click_button("Submit")

      expect(current_path).to eq(dish_path(@dish_1))
      expect(page).to have_content("Carrot")
      expect(page).to have_content("Celery")
      expect(page).to have_content("Total Calories: 60")
    end
  end
end