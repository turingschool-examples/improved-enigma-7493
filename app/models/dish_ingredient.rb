class DishIngredient < ApplicationRecord
  belongs_to :dish
  belongs_to :ingredient

  #make relationship test
end