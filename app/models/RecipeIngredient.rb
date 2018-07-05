class RecipeIngredient
  attr_accessor :recipe, :ingredient
  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end


end
