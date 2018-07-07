class User
	attr_accessor :recipe_card

	@@all = [] 
	def initialize(name)
		@name = name
		@@all << self
	end

	def self.all
		@@all
	end

	def recipes
		# return all recipes the user has recipe cards for
		recipe_cards = RecipeCard.all.select{|card| card.user == self}
		recipe_cards.map{|card| card.recipe }
	end

	def add_recipe_card(recipe_instance, date, rating)
		# create new recipe for this user and the given recipe
		recipe_card = RecipeCard.new(date, rating)
		recipe_card.recipe = recipe_instance
		recipe_card.user = self

	end

	def declare_allergen(ingredient)
		# create new allergen instance for this user and given ingredient
		Allergen.new(self, ingredient)
	end

	def allergens
		# return ingredients this user is allergic to
		allergens = Allergen.all.select{|allergen| allergen.user == self}
		allergens.map{|allergen| allergen.ingredient}
	end

	def top_three_recipes
		# return top 3 rated recipes for this user
		# sort_me.sort_by!{ |k| k["value"]}
		recipe_cards = RecipeCard.all.select{|card| card.user == self}
		sorted = recipe_cards.sort_by{|card| card.rating}.reverse
		top_three = sorted[0...3].map{|card| card.recipe}
	end

	def most_recent_recipe
		# return recipe most recently added to user's cookbook
		self.recipes.last
	end

	def safe_recipes
		my_unsafe_recipes = []

		users_allergens = Allergen.all.select{|allergen| allergen.user == self}
		allergic_ingredients = users_allergens.map{|allergen| allergen.ingredient}
		allergic_ingredients.each do |ingredient|
			Recipe.all.each do |recipe|
				if recipe.ingredients.include?(ingredient)
					my_unsafe_recipes << recipe
				end
			end
		end
		my_unsafe_recipes = my_unsafe_recipes.uniq
		Recipe.all.reject{|recipe| my_unsafe_recipes.include?(recipe) }
	end
end

# User#safe_recipes should return all recipes that do not contain ingredients the user is allergic to
