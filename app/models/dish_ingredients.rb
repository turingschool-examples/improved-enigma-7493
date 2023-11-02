class DishIngredient < ApplicationRecord
  belongs_to :ingredient
  belongs_to :dish

  validates :dish_id, uniqueness: {scope: :ingredient_id}
end
