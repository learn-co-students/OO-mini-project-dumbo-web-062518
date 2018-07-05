require 'pry'
class Ingredient
  attr_reader :name

@@all = []

def initialize(new_name)

    @name = new_name
    @@all << self

end

def self.all
  @@all
end

def self.most_common_allergy
  allergy = {}

  Allergen.all.map do |allergen|
    if allergy.has_key?(allergen.ingredient)
      allergy[allergen.ingredient] += 1
    else
      allergy[allergen.ingredient] = 1
    end
  end
  allergy.sort_by{|key, value| value}[-1]
  
  end

end
