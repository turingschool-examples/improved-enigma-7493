class Chef < ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def uniq_ingredients
    Ingredient.distinct.pluck(:name)
  end
end