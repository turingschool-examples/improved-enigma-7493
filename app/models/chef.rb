class Chef < ApplicationRecord
   validates_presence_of :name
   has_many :dishes
   has_many :dish_ingredients, through: :dishes
   has_many :ingredients, through: :dishes

   def top_3
      dishes.joins(:ingredients)
      .select("ingredients.*, COUNT(*) AS num_dishes")
      .group("ingredients.id")
      .order("num_dishes DESC")
      .limit(3)
   end
end