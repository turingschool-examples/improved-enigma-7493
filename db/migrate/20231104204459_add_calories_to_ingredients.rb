class AddCaloriesToIngredients < ActiveRecord::Migration[7.0]
  def change
    add_column :ingredients, :calories, :integer
  end
end
