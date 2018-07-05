class Recipe
attr_reader :name
@@all = []

def self.all
  @@all
end

def initialize(name, ingredients)
  @name = name
  ingredients.map do |ingredient|
    RecipeIngredient.new(self, ingredient)
  end
  @@all << self
end

def self.most_popular
  RecipeCard.all.max_by {|cards| cards.rating}
end

def users
  RecipeCard.all.map do |cards|
    if cards.recipe == self
      cards.user
    end
  end
end

def ingredients
  RecipeIngredient.all.map do |thing|
    if thing.recipe == self
      thing.ingredient
    end
  end
end

def allergens
  allergens = []

  Allergen.all.map do |allergen|
    ingredients.map do |ingredient|
      if ingredient == allergen.ingredient
        allergens << allergen
      end
    end
  end
  allergens
end

def add_ingredients(ingredient_array)
  ingredient_array.each do |ingredient|
    RecipeIngredient.new(self, ingredient)
  end
end

end
