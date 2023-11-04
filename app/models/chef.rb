class Chef < ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def uniq_ingredients
    ingredients = []

    dishes.each do |dish|
      dish.ingredients.each do |ingredient|
        ingredients << ingredient.name
      end
    end
    ingredients.uniq
  end
end