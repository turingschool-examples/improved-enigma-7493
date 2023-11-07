class DishIngredient < ApplicationRecord
  validates_presence_of :name, :description
  belongs_to :dish
  belongs_to :ingredient
end