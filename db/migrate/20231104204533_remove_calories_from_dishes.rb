class RemoveCaloriesFromDishes < ActiveRecord::Migration[7.0]
  def change
    remove_column :dishes, :calories, :integer
  end
end
