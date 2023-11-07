# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

@chef1 = Chef.create!(name: "Bobby Flay")
@chef2 = Chef.create!(name: "Alton Brown")

@dish1 = @chef1.dishes.create!(name: "Filet Mignon", description: "Medium Rare")
@dish2 = @chef1.dishes.create!(name: "Spaghetti", description: "Red Sauce")

@ingredient1 = Ingredient.create!(name: "Steak", calories: 800)
@ingredient2 = Ingredient.create!(name: "Potatoes", calories: 1100)
@ingredient3 = Ingredient.create!(name: "Asparagus", calories: 100)

DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @ingredient1.id)
DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @ingredient2.id)