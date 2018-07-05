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

  def allergens
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

  def safe_recipes
    safe_array = Array.new
    is_safe = 1

    Recipe.all.each do |recipe|
      recipe.ingredients.each do |ingredient|
        self.allergens.each do |allergen|
          if allergen.ingredient == ingredient.ingredient.name
            is_safe = 0
          end
        end
      end

      if is_safe == 1
        safe_array << recipe
      end

      is_safe = 1
    end
    safe_array
  end
end
