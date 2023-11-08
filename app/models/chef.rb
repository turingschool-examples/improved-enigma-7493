class Chef < ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def unique_ingredients_used
    Ingredient.joins(:ingredient_dishes).joins(:dishes).where("dishes.chef_id = ?", self.id).distinct
  end

  def top_three_ingredients
    
  end
end