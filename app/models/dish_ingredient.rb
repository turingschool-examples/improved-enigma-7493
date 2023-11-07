class DishIngredient < ApplicationRecord
  belongs_to :ingredients
  belongs_to :dish
end
