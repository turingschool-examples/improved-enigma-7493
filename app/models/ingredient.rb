class Ingredient < ApplicationRecord
  has_many :dishes
  has_many :dish_ingredients
end