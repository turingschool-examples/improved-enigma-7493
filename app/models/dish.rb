class Dish < ApplicationRecord
  validates_presence_of :name, :description
  belongs_to :chef
  has_many :dish_ingredients
  has_many :ingredients, through: :dish_ingredients

  def list_ingredients
    ingredients.order(:name).pluck(:name).to_sentence
  end

  def total_calories
    ingredients.pluck(:calories).sum
  end
end