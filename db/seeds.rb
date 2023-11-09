# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
@chef1 = Chef.create(name: "Frenchie")
@chef2 = Chef.create(name: "Baker Boy")

@dish1 = @chef1.dishes.create(name: "Soup", description: "Soupy Soup")
@dish2 = @chef2.dishes.create(name: "Goupy Goup", description: "Goupy Soupy Soup Goup")

@ingredient1 = Ingredient.create(name: "Onion", calories: 10)
@ingredient2 = Ingredient.create(name: "Garlic", calories: 20)
@ingredient3 = Ingredient.create(name: "Tomato", calories: 30)
@ingredient4 = Ingredient.create(name: "Noodle", calories: 40)
@ingredient5 = Ingredient.create(name: "Kisses", calories: 50)
@ingredient6 = Ingredient.create(name: "Hugs", calories: 60)

DishIngredient.create(dish_id: @dish1.id, ingredient_id: @ingredient1.id)
DishIngredient.create(dish_id: @dish1.id, ingredient_id: @ingredient2.id)
DishIngredient.create(dish_id: @dish1.id, ingredient_id: @ingredient3.id)
DishIngredient.create(dish_id: @dish1.id, ingredient_id: @ingredient4.id)
DishIngredient.create(dish_id: @dish2.id, ingredient_id: @ingredient5.id)
DishIngredient.create(dish_id: @dish2.id, ingredient_id: @ingredient6.id)