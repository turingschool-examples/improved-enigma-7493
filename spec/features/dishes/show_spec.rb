require "rails_helper"

RSpec.describe "Dishes Show Page", type: :model do 
  before :each do 

    @mario = Chef.create!({name: "Mario"})
    @luigi = Chef.create!({name: "Luigi"})

    @lasagna = Dish.create!({name: "Lasagna", description: "Chef favorite"})
    @sushi = Dish.create!({name: "Sushi", description: "Flown in daily"})

    @salt = Ingredient.create!({name: "Salt", calories: 200})
    @pepper = Ingredient.create!({name: "Pepper", calories: 25})
    @oregano = Ingredient.create!({name: "Oregano", calories: 75})

    @salted_lasagna = DishIngredient.create!({ dish_id: @lasgna.id, ingredient_id: @salt.id })
    @peppered_lasagna = DishIngredient.create!({ dish_id: @lasgna.id, ingredient_id: @pepper.id })
    @oregano_lasagna = DishIngredient.create!({ dish_id: @lasgna.id, ingredient_id: @oregano.id })
    @salted_sushi = DishIngredient.create!({ dish_id: @sushi.id, ingredient_id: @salt.id})
  end

  
  it "shows the dish's name and description" do

    visit "/dishes/index"
  
    within "#index-#{@lasagna.id}" do
      expect(page).to have_content("Lasagna")
      expect(page).to have_content("Pepper")
      expect(page).to have_content("Oregano")
      expect(page).to have_content("Total Calories")
      expect(page).to have_content("Mario")
      
    end
  
    within "#sush-#{@sushi.id}" do
      expect(page).to have_content("Sushi")
      expect(page).to have_content("Salt")
      expect(page).to have_content("Total Calories")
      expect(page).to have_content("Luigi")
    end
  end
end 