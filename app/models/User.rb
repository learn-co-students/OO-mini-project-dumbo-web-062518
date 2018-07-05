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

  def recipes
    cards = RecipeCard.all.select { |recipe_card| recipe_card.user == self }
    cards.map { |card| card.recipe }
  end

  def add_recipe_card(recipe, date, rating)
    new_recipe_card = RecipeCard.new(recipe, date, rating)
    new_recipe_card.user = self
  end

  def declare_allergen(ingredient)
    new_allergen = Allergen.new(ingredient)
    new_allergen.user = self
  end

  def allergens(ingredient)
    Allergen.all.select { |allergen| allergen.user == self }
  end

  def top_three_recipes
    cards = RecipeCard.all.select { |recipe_card| recipe_card.user == self }
    top_cards = cards.sort { |x, y| y.rating <=> x.rating }
    top_cards.take(3)
  end

  def most_recent_recipe
    cards = RecipeCard.all.select { |recipe_card| recipe_card.user == self }
    recent = cards.sort { |x, y| y.date <=> x.date }
    recent.take(1)
    binding.pry
  end
end
