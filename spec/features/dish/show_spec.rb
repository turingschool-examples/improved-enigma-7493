require 'rails_helper'

RSpec.describe 'dish show page' do
  before (:each) do
    @paul = Chef.create!(name: "Paul") 
    @prue = Chef.create!(name: "Prue")

    @grilledcheese = @paul.dishes.create!(name: "Grilled Cheese", description: "Bread and Cheese")
    @turkeysandwich = @paul.dishes.create!(name: "Turkey Sandwich", description: "Bread and Cheese")
    @cake = @prue.dishes.create!(name: "Chocolate Cake", description: "Delicious")
    @scone = @prue.dishes.create!(name: "Blueberry Scone", description: "ehh")

    @blueberry = @scone.ingredients.create!(name: "blueberry", calories: 1)
    @flour = @scone.ingredients.create!(name: "flour", calories: 455)
    @bread = @turkeysandwich.ingredients.create!(name: "bread", calories: 160)
    @turkey = @turkeysandwich.ingredients.create!(name: "turkey", calories: 60)
    @tomato = Ingredient.create!(name: "tomato", calories: 22)




    # @dish_ingredient1 = DishIngredient.create!(dish_id: @scone.id, ingredient_id: @blueberry.id)
    # @dish_ingredient2 = DishIngredient.create!(dish_id: @scone.id, ingredient_id: @flour.id)
    # @dish_ingredient3 = DishIngredient.create!(dish_id: @turkeysandwich.id, ingredient_id: @turkey.id)
    # @dish_ingredient4 = DishIngredient.create!(dish_id: @turkeysandwich.id, ingredient_id: @bread.id)

  end

  describe 'visit dish show page' do
    it 'shows the dishes name and description' do
      visit "/chef/#{@paul.id}/dishes/#{@grilledcheese.id}"
      expect(page).to have_content(@grilledcheese.name)
      expect(page).to have_content(@grilledcheese.description)
    end
    it 'shows the ingredients and total calories' do
      visit "/chef/#{@prue.id}/dishes/#{@scone.id}"
      expect(page).to have_content(@blueberry.name)
      expect(page).to have_content(@flour.name)
      expect(page).to have_content(@scone.calories)
    end

    it 'has a form to add ingredients' do
      visit "/chef/#{@paul.id}/dishes/#{@turkeysandwich.id}"
      expect(page).to_not have_content(@tomato.name)
      fill_in "Add ingredient", with: "#{@tomato.id}"
      click_button "Add"
      expect(current_path).to eq("/chef/#{@paul.id}/dishes/#{@turkeysandwich.id}")
      expect(page).to have_content(@tomato.name)
    end

    it 'has a button to delete ingredients' do
      visit "/chef/#{@paul.id}/dishes/#{@turkeysandwich.id}"
      expect(page).to have_content(@turkey.name)
      expect(page).to have_content(@bread.name)
      expect(page).to have_button("Remove #{@turkey.name}")
      expect(page).to have_button("Remove #{@bread.name}")
      click_button "Remove #{@bread.name}"
      require 'pry'; binding.pry
      expect(current_path).to be("/chef/#{@paul.id}/dishes/#{@turkeysandwich.id}")
      expect(page).to_not have_content(@bread.name)
      
    end
  
  end


end