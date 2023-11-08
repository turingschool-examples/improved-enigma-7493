class AddChefIdToIngredients < ActiveRecord::Migration[7.0]
  def change
    add_reference :ingredients, :chef, foreign_key: true
  end
end
