class Dish < ApplicationRecord
  validates_presence_of :name, :description
  belongs_to :chef
  has_many :dish_ingredients
  has_many :ingredients, through: :dish_ingredients

  # Refactor to use AR?
  def total_calories
    total = 0
    ingredients.each do |ingredient|
      total += ingredient.calories
    end
    total
  end
end