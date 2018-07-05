class RecipeCard
  @@all = []
  attr_reader :date, :rating, :user, :recipe

  def initialize(recipe, date, rating, user)
    @recipe = recipe
    @date = date
    @rating = rating
    @user = user
    @@all << self
  end

  def self.all
    @@all
  end
end
