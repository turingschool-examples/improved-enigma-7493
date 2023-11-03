class Ingredient < ApplicationRecord
  has_many :dish_ingredients
  has_many :dishes, through: :dish_ingredients

  validates_presence_of :name, presence: true 
  validates_presence_of :calories, presence: true 
  validates_numericality_of :calories, presence: true 
end