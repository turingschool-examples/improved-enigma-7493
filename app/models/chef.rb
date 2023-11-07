class Chef < ApplicationRecord
   validates_presence_of :name
   has_many :dishes
   has_many :ingredients, through: :dishes

   def distinct_ingredients
      ingredients.distinct.order(:name).pluck(:name)
   end

   def popular_ingredients
      ingredients.select("ingredients.*, count(ingredients.id) as pop_ingredients").group("ingredients.id").order(pop_ingredients: :desc).limit(3)
   end
end