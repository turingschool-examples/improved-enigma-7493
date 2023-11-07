class DishIngredient < ApplicationRecord
  validates_presence_of :dish, :ingredient
  belongs_to :dish
  belongs_to :ingredient
end