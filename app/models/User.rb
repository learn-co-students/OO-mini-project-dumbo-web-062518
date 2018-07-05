class User
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def recipe
  end

  def add_recipe_card

  end

  def allergens
  end

  def top_three_recipes

  end

  def most_recent_recipe

  end
end
