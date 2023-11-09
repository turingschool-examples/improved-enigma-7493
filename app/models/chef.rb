class Chef < ApplicationRecord
   validates_presence_of :name
   has_many :dishes

   def chef_ingredients
      self.dishes
      .joins(dish_ingredients: :ingredient)
      .select("ingredients.name")
      .distinct
   end
end