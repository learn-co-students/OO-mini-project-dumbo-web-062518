class Ingredient
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_common_allergen
    allergen_hash = Hash.new(0)

    Allergen.all.each do |allergen|
      allergen_hash[allergen.ingredient] += 1
    end

    allergen_hash_sorted = allergen_hash.sort_by { |allergen, count| count }
    allergen_hash_sorted[-1]
  end


end
