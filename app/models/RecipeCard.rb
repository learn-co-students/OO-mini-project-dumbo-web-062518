class RecipeCard
	attr_accessor :date, :rating, :user, :recipe

	@@all = []

	def initialize(date, rating)
		@date = date
		@rating = rating
		@@all << self
	end

	def self.all
		@@all
	end
end

