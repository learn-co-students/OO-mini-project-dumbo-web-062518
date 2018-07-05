require_relative '../config/environment.rb'

# users
joe = User.new("Joe")
jane = User.new("Jane")
zoe = User.new("Zoe")
frank = User.new("Frank")

# recipes
pie = Recipe.new("Key Lime Pie")
okroshka = Recipe.new("Okroshka")
borscht = Recipe.new("Borscht")
chicken = Recipe.new("Lemon Chicken")
baba_ganoush = Recipe.new("Baba Ganoush")
oliviet = Recipe.new("Oliviet")

# ingredients
potatoes = Ingredient.new("potatoes")
carrots = Ingredient.new("carrots")
chick_chick = Ingredient.new("chicken")
peas = Ingredient.new("peas")
beets = Ingredient.new("beets")
pork = Ingredient.new("pork")
limes = Ingredient.new("limes")
crust = Ingredient.new("crust")

joe.add_recipe_card(pie, "Oct 1", 5.5)
joe.add_recipe_card(okroshka, "Dec 12", 10)
joe.add_recipe_card(chicken, "Jul 4", 9)
joe.add_recipe_card(oliviet, "Jul 10", 8)
jane.add_recipe_card(oliviet, "Aug 4", 8)

pie.add_ingredients([crust, limes])
borscht.add_ingredients([pork, beets])
oliviet.add_ingredients([potatoes, carrots, chick_chick, peas])

joe.declare_allergen(limes)
joe.declare_allergen(beets)
jane.declare_allergen(limes)
jane.declare_allergen(potatoes)
jane.declare_allergen(carrots)

binding.pry

# binding.pry
