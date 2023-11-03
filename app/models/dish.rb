class Dish < ApplicationRecord
  validates_presence_of :name, :description
  belongs_to :chef
  has_many :dish_ingredients, dependent: :destroy
  has_many :ingredients, through: :dish_ingredients, dependent: :destroy

  def list_ingredients
    ingredients.order(:name).pluck(:name)
  end

  def total_calories
    ingredients.pluck(:calories).sum
  end
end