require "rails_helper"

RSpec.describe "Dish show" do
  before :each do
    @chef_1 = Chef.create!(name: "Naruto")
    @dish_1 = @chef_1.dishes.create!(name: "Ramen", description: "delicious ichiraku ramen cooked fresh", chef_id: @chef_1.id)
    @ingredient_1 = Ingredient.create!(name: "Tonkatsu", calories: 7)
    @ingredient_2 = Ingredient.create!(name: "Udon Noodle", calories: 21)
    @ingredient_3 = Ingredient.create!(name: "Bone Broth", calories: 49)
    @ingredient_4 = Ingredient.create!(name: "Shoyu Egg", calories: 77)

    DishIngredient.create(dish_id: @dish_1.id, ingredient_id: @ingredient_1.id)
    DishIngredient.create(dish_id: @dish_1.id, ingredient_id: @ingredient_2.id)
    DishIngredient.create(dish_id: @dish_1.id, ingredient_id: @ingredient_3.id)
  end

  describe "US 1 - When I visit a dish's show page" do
    describe "I see the dish's name and description" do
      describe "I see a list of ingredients for that dish and total calorie count" do
        it "I also see the chefs name" do
          visit "/dishes/#{@dish_1.id}"

          within "#dish-info" do
            expect(page).to have_content(@dish_1.name)
            expect(page).to have_content(@dish_1.description)
            expect(page).to have_content(@ingredient_1.name)
            expect(page).to have_content(@ingredient_2.name)
            expect(page).to have_content(@ingredient_3.name)
          end

          within "#total-calories" do
            expect(page).to have_content("Total Calories: 77")
          end

          expect(page).to have_content("Chef: #{@chef_1.name}")
        end
      end
    end
  end

  describe "US 2 - I see a form to add an existing ingredient to the dish" do
    describe "I fill in the form with the ID of the ingredient and click submit" do
      it "redirects to the show page and I see that ingredient listed now" do
        visit "/dishes/#{@dish_1.id}"

        within "#dish-info" do
          expect(page).to have_content(@dish_1.name)
          expect(page).to have_content(@dish_1.description)
          expect(page).to have_content(@ingredient_1.name)
          expect(page).to have_content(@ingredient_2.name)
          expect(page).to have_content(@ingredient_3.name)
        end

        expect(page).to have_no_content(@ingredient_4.name)

        expect(page).to have_content("Add an ingredient to this dish")
        expect(page).to have_field(:ingredient_id)

        fill_in "Ingredient ID", with: @ingredient_4.id
        click_button "Add Ingredient"

        expect(current_path).to eq("/dishes/#{@dish_1.id}")

        within "#dish-info" do
          expect(page).to have_content(@ingredient_4.name)
        end
      end
    end
  end
end
