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
		hash_with_counts = {}
		Allergen.all.each do |allergen|
			if hash_with_counts[allergen]
				hash_with_counts[allergen] += 1
			else 
				hash_with_counts[allergen] = 1
			end
		end
		return hash_with_counts.max_by{|k,v| v}
	end

end
