class Recipe

	@@all = []

	def initialize(name)
		@name = name
		@@all << self
	end

	def self.all
		@@all
	end

	def self.most_popular
		# return most popular recipe (highest number of users)
		# RecipeCard.all.map{|card| card.recipe}
		num_users = 0
		most_popular = @@all[0]
		@@all.each do |recipe|
			if recipe.users.length > num_users
				num_users = recipe.users.length
				most_popular = recipe
			end
		end
		return most_popular
	end

	def users
		# return arrays of users who have recipe cards with this recipe
		recipe_cards_with_this_recipe = RecipeCard.all.select{|card| card.recipe == self}
		recipe_cards_with_this_recipe.map{|card| card.user}

	end

	def ingredients
		# return all ingredients in this recipe
		# binding.pry
		all_cards_with_this_recipe = RecipeIngredient.all.select{|card| card.recipe == self}
		all_cards_with_this_recipe.map{|card| card.ingredient}
		# binding.pry


	end

	def allergens
		# return ingredients that are allergens
		all_allergen_ingredients = Allergen.all.map{|allergen| allergen.ingredient}
		result = all_allergen_ingredients.select{|ingredient| self.ingredients.include?(ingredient)}.uniq
		result

	end

	def add_ingredients(array_ing_instances)
		# takes array of ingredients and associates each with this recipe
		array_ing_instances.each do |ingredient|
			RecipeIngredient.new(ingredient, self)
		end
	end
end
