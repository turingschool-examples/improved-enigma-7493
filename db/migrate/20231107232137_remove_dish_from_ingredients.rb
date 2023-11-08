class RemoveDishFromIngredients < ActiveRecord::Migration[7.0]
  def change
    remove_reference :ingredients, :dish, null: false, foreign_key: true
  end
end
