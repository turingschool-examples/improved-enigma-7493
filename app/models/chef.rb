class Chef < ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def unique_ingredients_used
    Ingredient.joins(:ingredient_dishes).joins(:dishes).where("dishes.chef_id = ?", self.id).distinct
  end

  def top_three_ingredients
    Ingredient.joins(:ingredient_dishes)
              .joins(:dishes)
              .group(:id)
              .where("dishes.chef_id = ?", self.id)
              .select("ingredients.*, SUM(ingredients.id) AS total_use")
              .order("total_use DESC")
              .limit(3)
  end
end