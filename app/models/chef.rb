class Chef < ApplicationRecord
   validates_presence_of :name
   has_many :dishes
   has_many :dish_ingredients, through: :dishes
   has_many :ingredients, through: :dish_ingredients

   def top_three_ingredients
      Ingredient.joins(:chefs).select("ingredients.*, count(ingredients.id) as popularity").where("chefs.id = #{id}").group("ingredients.id").order("popularity desc").limit(3)

   end
end