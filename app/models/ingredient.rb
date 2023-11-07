class Ingredient < ApplicationRecord
  validates_presence_of :name, :calories
  has_many :dishingredients
  has_many :dishes, through: :dishingredients
end