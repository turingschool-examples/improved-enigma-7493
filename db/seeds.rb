@chef1 = Chef.create!(name: "Gordon Ramsey")
    
@dish1 = @chef1.dishes.create!(name: "Chicken Pot Pie", description: "Mom's recipe")

@ingredient1 = Ingredient.create!(name: "Chicken", kcal: 200)
@ingredient2 = Ingredient.create!(name: "Milk", kcal: 60)
@ingredient3 = Ingredient.create!(name: "Flour", kcal: 30)

@dish_ingredient_1 = DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @ingredient1.id)
@dish_ingredient_2 = DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @ingredient2.id)
@dish_ingredient_3 = DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @ingredient3.id)