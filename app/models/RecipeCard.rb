class RecipeCard
  attr_accessor :date, :rating, :user, :recipe
  @@all = []

  def initialize(recipe, date, rating)
    @recipe = recipe
    @date = date
    @rating = rating
    @@all << self
  end

  def self.all
    @@all
  end

end
