class Chef < ApplicationRecord
   validates_presence_of :name
   has_many :dishes


   def ingredient_list
   ingredients = []
      self.dishes.each do |dish|
         ingredients << dish.ingredients.pluck(:name)
      end
      ingredients.flatten.uniq
   end




end

