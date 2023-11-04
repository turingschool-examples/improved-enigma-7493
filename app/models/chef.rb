class Chef < ApplicationRecord
   validates_presence_of :name
   has_many :dishes
   has_many :dish_ingredients, through: :dishes
   has_many :ingredients, through: :dish_ingredients

   def ingredient_distinct
      ingredients.distinct.pluck(:name)
   end
end