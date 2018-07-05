require 'date'

class User

  attr_reader :name, :allergens
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def recipes
    RecipeCard.all.select {|card| card.user == self}
  end

  def add_recipe_card(name, recipe, date, rating)
    RecipeCard.new(name, self, recipe, date, rating)
  end

  def declare_allergen(ingredient)
    Allergen.new(ingredient, self)
  end


  def allergens
    Allergen.all.map do |allergens|
      allergens.user == self
      allergens.ingredient
    end
  end

  def top_three_recipes
    arr = []
    top_three = RecipeCard.all.sort_by do |recipecard|
      recipecard.rating
    end
    top_three.reverse[0..2]
  end

  def most_recent_recipe
    recent = RecipeCard.all.sort_by do |cards|
      cards.date
    end
    recent[-1]
  end

  def safe_recipes
    safe = Recipe.all
    Recipe.all.map do |recipe|
      recipe.allergens.map do |recipe_allergen|
        self.allergens.map do |self_allergen|
        if self_allergen == recipe_allergen.ingredient
        safe.delete(recipe)
        safe_recipes
      end
      end
      end
    end
    safe
    end
      # Allergen.all.map do |allergen|
      #   RecipeIngredient.all.map do |rin|
      #     rin.ingredient != allergen.ingredie

end
