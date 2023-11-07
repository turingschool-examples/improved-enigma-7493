class AddIngredientsToDishIngredients < ActiveRecord::Migration[7.0]
    add_reference :dish_ingredients, :ingredient, null: false, foreign_key: true
    def change
  end
end
