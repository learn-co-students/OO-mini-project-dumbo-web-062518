class Ingredient	
	
	@@all = []

	def initialize(name)
		@name = name
		@@all << self
		
	end

	def self.all
		@@all
	end

	def self.most_common_allergen
		# return ingredient that has highest number of users allergic to it
		Allergen.all.map{|allergen| allergen.user}
	end
end



# Ingredient.most_common_allergen should return the ingredient instance that the highest number of users are allergic to