require_relative '../config/environment.rb'

andre = User.new("Andre")
dan = User.new("Dan")
marlon = User.new("Marlon")
steven = User.new("Steven")

dough = Ingredient.new("dough")
sauce = Ingredient.new("sauce")
cheese = Ingredient.new("cheese")
pepperoni = Ingredient.new("pepperoni")
nuts = Ingredient.new("nuts")
eggs = Ingredient.new("eggs")
banana = Ingredient.new("banana")
lettuce = Ingredient.new("lettuce")
avacado = Ingredient.new("avacado")
chicken = Ingredient.new("chicken")
onion = Ingredient.new("onion")
beef = Ingredient.new("beef")


pizza = Recipe.new("Pizza")
pizza_array = [dough, sauce, cheese, pepperoni]
pizza.add_ingredients(pizza_array)

muffin = Recipe.new("Muffin")
muffin_array = [dough, nuts, eggs, banana]
muffin.add_ingredients(muffin_array)

sandwich = Recipe.new("Sandwich")
sandwich_array = [lettuce, avacado, cheese, chicken]
sandwich.add_ingredients(sandwich_array)

meatloaf = Recipe.new("meatloaf")
meatloaf_array = [onion, beef, sauce, eggs]
meatloaf.add_ingredients(meatloaf_array)

andre.add_recipe_card(pizza, "07-05-2018", 5)
andre.add_recipe_card(muffin, "07-12-2018", 2)
andre.add_recipe_card(sandwich, "07-15-2018", 3)
andre.add_recipe_card(meatloaf, "07-17-2018", 1)

dan.add_recipe_card(pizza, "07-08-2018", 5)
dan.add_recipe_card(muffin, "07-19-2018", 2)
dan.add_recipe_card(sandwich, "07-24-2018", 4)
dan.add_recipe_card(meatloaf, "07-17-2018", 9)

dan_gluten = Allergen.new(dan, dough)
marlon_dairy = Allergen.new(marlon, cheese)

steven.declare_allergen(pepperoni)
marlon.declare_allergen(beef)
andre.declare_allergen(cheese)






binding.pry
