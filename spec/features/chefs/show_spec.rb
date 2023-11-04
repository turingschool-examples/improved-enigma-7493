require "rails_helper"

RSpec.describe "Chef show" do
  before :each do
    @chef_1 = Chef.create!(name: "Naruto")
    @dish_1 = @chef_1.dishes.create!(name: "Ramen", description: "delicious ichiraku ramen cooked fresh", chef_id: @chef_1.id)
    @dish_2 = @chef_1.dishes.create!(name: "Hibachi", description: "banging friend rice", chef_id: @chef_1.id)
    @ingredient_1 = Ingredient.create!(name: "Tonkatsu", calories: 7)
    @ingredient_2 = Ingredient.create!(name: "Udon Noodle", calories: 21)
    @ingredient_3 = Ingredient.create!(name: "Steak", calories: 49)
    @ingredient_4 = Ingredient.create!(name: "Fried Rice", calories: 77)

    DishIngredient.create(dish_id: @dish_1.id, ingredient_id: @ingredient_1.id)
    DishIngredient.create(dish_id: @dish_1.id, ingredient_id: @ingredient_2.id)
    DishIngredient.create(dish_id: @dish_1.id, ingredient_id: @ingredient_3.id)
    DishIngredient.create(dish_id: @dish_2.id, ingredient_id: @ingredient_3.id)
    DishIngredient.create(dish_id: @dish_2.id, ingredient_id: @ingredient_4.id)
  end

  describe "US 3 - When I visit a chef's show page" do
    describe "I see a link to view a list of all ingredients this chef uses and click on it" do
      it "takes me to the chefs ingredients index page and lists all ingredients" do
        visit "/chefs/#{@chef_1.id}"

        expect(page).to have_link("Ingredients Chef Uses")
        click_link("Ingredients Chef Uses")

        expect(current_path).to eq("/chefs/#{@chef_1.id}/ingredients")

        expect(page).to have_content(@ingredient_1.name)
        expect(page).to have_content(@ingredient_2.name)
        expect(page).to have_content(@ingredient_3.name)
        expect(page).to have_content(@ingredient_4.name)
      end
    end
  end
end
