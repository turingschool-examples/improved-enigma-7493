class AddUniqueIndexToDishesIngredients < ActiveRecord::Migration[7.0]
  def change
    # Add foreign key for dishes
    add_foreign_key :dishes_ingredients, :dishes

    # Add foreign key for ingredients
    add_foreign_key :dishes_ingredients, :ingredients

    add_index :dishes_ingredients, [:dish_id, :ingredient_id], unique: true
  end
end
