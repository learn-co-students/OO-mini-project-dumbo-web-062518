class Recipe
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_popular

  end

  def users

  end

  def ingredients
    RecipeIngredient.all.select do |ingredient|
      ingredient.recipe == self
    end
  end

  def allergens

  end

  def add_ingredients(ingredient_array)
    ingredient_array.each do |ingredient|
      new_ingredient = Ingredient.new(ingredient)
      new_recipe_ingredient = RecipeIngredient.new
      new_recipe_ingredient.recipe = self
      new_recipe_ingredient.ingredient = new_ingredient
    end
  end

end
