class RecipeIngredient

  attr_accessor :recipe, :ingredient

  @@all = []

  def initialize(recipe, ingredient)
    @ingredient = ingredient
    @recipe = recipe
    @@all << self
  end

  def self.all
    @@all
  end

end
