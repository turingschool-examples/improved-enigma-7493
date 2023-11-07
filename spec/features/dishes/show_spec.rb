require "rails_helper"

RSpec.describe "Dishes Show" do
  before(:each) do
    @cheflauren = Chef.create(name: "Lauren")
    @dish = @cheflauren.dishes.create(name: "Croquembouche", description: "Alternative to a French wedding cake with pastry puffs filled with pastry cream")
    @dish2 = @cheflauren.dishes.create(name: "Creme Brulee", description: "Pure crema made of vanilla bean extract and finished with a hot iron press")
    @sugar = Ingredient.create(name: "Sugar", calories: 80)
    @salt = Ingredient.create(name: "Salt", calories: 15)
    @vanillabean = Ingredient.create(name: "Vanilla Bean Extract", calories: 50)
    @eggyolks = Ingredient.create(name: "Egg Yolks", calories: 270)

    @dishingredient = DishIngredient.create(dish: @dish, ingredient: @sugar)
    @dishingredient2 = DishIngredient.create(dish: @dish, ingredient: @salt)
    @dishingredient3 = DishIngredient.create(dish: @dish2, ingredient: @sugar)
    @dishingredient4 = DishIngredient.create(dish: @dish2, ingredient: @salt)
    @dishingredient5 = DishIngredient.create(dish: @dish2, ingredient: @vanillabean)
    @dishingredient6 = DishIngredient.create(dish: @dish2, ingredient: @eggyolks)
  end

  describe '#USER STORY 1/3' do
    it 'when visiting the dish show page, the dish name and description appear' do
      visit "/dishes"
      save_and_open_page
      Dish.all.each do |dish|
        expect(page).to have_content(dish.name)
        expect(page).to have_content(dish.description)
        expect(page).to have_content(dish.name)
        expect(page).to have_content(dish.ingredients)
        expect(page).to have_content(dish.name)
      end
    end
  end

end