require 'rails_helper'

RSpec.describe 'chef show page' do
  before (:each) do
    @paul = Chef.create!(name: "Paul") 
    @prue = Chef.create!(name: "Prue")

    @grilledcheese = @paul.dishes.create!(name: "Grilled Cheese", description: "Bread and Cheese")
    @turkeysandwich = @paul.dishes.create!(name: "Turkey Sandwich", description: "Bread and Cheese")
    @cake = @prue.dishes.create!(name: "Chocolate Cake", description: "Delicious")
    @scone = @prue.dishes.create!(name: "Blueberry Scone", description: "ehh")

    @blueberry = Ingredient.create!(name: "blueberry", calories: 1)
    @flour = Ingredient.create!(name: "flour", calories: 455)
    @bread = Ingredient.create!(name: "bread", calories: 160)
    @turkey = Ingredient.create!(name: "turkey", calories: 60)
    @tomato = Ingredient.create!(name: "tomato", calories: 22)
    @cheese = Ingredient.create!(name: "cheese", calories: 100)

    @dish_ingredient1 = DishIngredient.create!(dish_id: @scone.id, ingredient_id: @blueberry.id)
    @dish_ingredient2 = DishIngredient.create!(dish_id: @scone.id, ingredient_id: @flour.id)
    @dish_ingredient3 = DishIngredient.create!(dish_id: @turkeysandwich.id, ingredient_id: @turkey.id)
    @dish_ingredient4 = DishIngredient.create!(dish_id: @turkeysandwich.id, ingredient_id: @bread.id)
    @dish_ingredient3 = DishIngredient.create!(dish_id: @grilledcheese.id, ingredient_id: @cheese.id)
    @dish_ingredient4 = DishIngredient.create!(dish_id: @grilledcheese.id, ingredient_id: @bread.id)
  end

  describe 'visit chef show page' do
    it 'has a link' do 
    visit "/chef/#{@paul.id}"
    expect(page).to have_link("ingredients")
    click_link "ingredients"
    expect(current_path).to eq("/chef/#{@paul.id}/ingredients")
    
      expect(page).to have_content("bread")
      expect(page).to have_content("turkey")
      expect(page).to have_content("cheese")
    end
  end

end