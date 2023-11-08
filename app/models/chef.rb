class Chef < ApplicationRecord
   validates_presence_of :name
   has_many :dishes

   def ingredients
     Ingredient.joins(dishes: :chef).where(chefs: { id: id })
   end
end