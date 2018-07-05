class Ingredient
  @@all = []
  attr_reader :name

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_common_allergen
    ingredient_hash = Hash.new(0)
    Allergen.all.each do |allergen|
      ingredient_hash[allergen.ingredient]+=1
    end
    ingredient_hash.max_by{|k,v| v}
  end

end
