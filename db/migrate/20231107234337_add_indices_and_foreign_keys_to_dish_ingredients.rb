class AddIndicesAndForeignKeysToDishIngredients < ActiveRecord::Migration[7.0]
  def change
    add_index :dishes_ingredients, :dish_id
    add_index :dishes_ingredients, :ingredient_id

    add_foreign_key :dishes_ingredients, :dishes
    add_foreign_key :dishes_ingredients, :ingredients
  end
end
