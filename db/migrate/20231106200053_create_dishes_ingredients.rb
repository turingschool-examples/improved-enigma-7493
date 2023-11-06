class CreateDishesIngredients < ActiveRecord::Migration[7.0]
  def change
    create_table :dishes_ingredients do |t|
      t.references :dishes, null: false, foreign_key: true
      t.references :ingredients, null: false, foreign_key: true

      t.timestamps
    end
  end
end
