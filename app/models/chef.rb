class Chef < ApplicationRecord
   validates_presence_of :name
   has_many :dishes

   def list_ingredients
      dishes.map do |dish|
         dish.ingredients.select do |ingredient|
            ingredient.name
         end
      end
   end
end