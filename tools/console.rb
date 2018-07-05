require_relative '../config/environment.rb'

andre = User.new("Andre")
dan = User.new("Dan")

pizza = Recipe.new("Pizza")
pizza_array = ["dough", "sauce", "cheese", "pepperoni"]
pizza.add_ingredients(pizza_array)

muffin = Recipe.new("Muffin")
muffin_array = ["dough", "nuts", "eggs", "banana"]
muffin.add_ingredients(muffin_array)

sandwich = Recipe.new("Sandwich")
sandwich_array = ["lettuce", "avacado", "cheese", "chicken"]
sandwich.add_ingredients(sandwich_array)

andre.add_recipe_card(pizza, "07-05-2018", 5)
dan.add_recipe_card(pizza, "07-08-2018", 5)
andre.add_recipe_card(muffin, "07-12-2018", 2)
andre.add_recipe_card(sandwich, "07-15-2018", 3)
dan.add_recipe_card(muffin, "07-19-2018", 1)
dan.add_recipe_card(sandwich, "07-24-2018", 4)

binding.pry
