require_relative '../config/environment.rb'


food = Recipe.new("Pizza")
food_array = ["dough", "sauce", "cheese", "pepperoni"]
food.add_ingredients(food_array)

binding.pry
