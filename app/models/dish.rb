class Dish < ApplicationRecord
  validates_presence_of :name, :description
  belongs_to :chef
  has_many :dish_ingredients
  has_many :ingredients, through: :dish_ingredients

  def calories_total
    ingredients.sum("calories")
  end

  def print_ingredients
    ingredients.pluck(:name).join(", ")
  end
end