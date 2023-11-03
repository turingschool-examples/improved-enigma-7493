# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
@gordon = Chef.create!(name: "Gordon Ramsay")

@dish1 = @gordon.dishes.create!(name: "Burger", description: "Wagyu burger")
@dish2 = @gordon.dishes.create!(name: "Salad", description: "Clean salad")
@dish3 = @gordon.dishes.create!(name: "Soup", description: "Very warm soup")

@beef = Ingredient.create!(name: "Beef", calories: 235)
@lettuce = Ingredient.create!(name: "Lettuce", calories: 50)
@tomato = Ingredient.create!(name: "Tomato", calories: 15)
@onion = Ingredient.create!(name: "Onion", calories: 35)
@bread = Ingredient.create!(name: "Bread", calories: 100)

DishIngredient.create!(dish: @dish1, ingredient: @beef)
DishIngredient.create!(dish: @dish1, ingredient: @onion)
DishIngredient.create!(dish: @dish1, ingredient: @tomato)
DishIngredient.create!(dish: @dish1, ingredient: @bread)
DishIngredient.create!(dish: @dish2, ingredient: @tomato)
DishIngredient.create!(dish: @dish2, ingredient: @lettuce)
DishIngredient.create!(dish: @dish3, ingredient: @bread)
DishIngredient.create!(dish: @dish3, ingredient: @tomato)