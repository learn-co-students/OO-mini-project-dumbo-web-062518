def Recipe
  @@all = []
  def self.all
    @@all
  end

  def self.most_popular
    RecipeCard.all
  end

  def users
    RecipeCard.all
  end

  def ingredients
    RecipeIngredient.all
  end

  def allergens
    RecipeIngredient.all
  end

  def add_ingredients(ingredients)
    
  end
end
