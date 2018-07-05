class RecipeCard
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def date

  end

  def rating

  end

  def user

  end

  def recipe

  end
end
