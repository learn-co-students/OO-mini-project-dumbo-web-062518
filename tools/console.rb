require_relative '../config/environment.rb'
require_relative '../app/models/Recipe.rb'
require_relative '../app/models/RecipeCard.rb'
require_relative '../app/models/RecipeIngredient.rb'
require_relative '../app/models/User.rb'
require_relative '../app/models/Allergen.rb'
require_relative '../app/models/Ingredient.rb'
require 'date'

peter = User.new("Peter")
anthony = User.new("Anthony")

chicken_breast = Ingredient.new("chicken breast")
salt = Ingredient.new("Salt")
pepper = Ingredient.new("Pepper")
fish = Ingredient.new("Fish")

peter_allergy = Allergen.new(pepper, peter)
anthony_allergy = Allergen.new(pepper, anthony)
peter_allergy = Allergen.new(fish, peter)

chicken = Recipe.new("Chicken", [chicken_breast, salt, pepper])
surfnturf = Recipe.new("Surf n Turf", [salt, fish, chicken_breast])
spice = Recipe.new("Only spice", [pepper, salt])
fish = Recipe.new("Fish", [salt, pepper, fish])
simple = Recipe.new("Another Recipe", [salt, pepper, fish, chicken])
chicken2 = Recipe.new("Chicken2", [chicken_breast, salt, pepper])

peter_chicnet = peter.add_recipe_card("Peter's Chick-Net", chicken, Date.new(2018, 1, 1), 7)
fishnet = anthony.add_recipe_card("Fishnet", fish, Date.new(2018, 2, 2), 3)
anthony_chicken = anthony.add_recipe_card("Anthony's chicken", chicken, Date.new(2018, 2, 2), 6)
anthony_surf = anthony.add_recipe_card("Surfing", surfnturf, Date.new(2018, 2, 2), 9)
anthony_spice = anthony.add_recipe_card("hate", spice, Date.new(2018, 5, 5), 1)

pry.Start
