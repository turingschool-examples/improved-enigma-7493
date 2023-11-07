class CreateJoinTableDishIngredient < ActiveRecord::Migration[7.0]
  def change
    create_join_table :dishes, :ingredients do |t|
      # t.index [:dish_id, :ingredient_id]
      # t.index [:ingredient_id, :dish_id]
    end
  end
end
