class Recipe
  @@all = []

  attr_reader :name

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_popular
    recipe_hash = Hash.new(0)
    RecipeCard.all.each do |card|
      recipe_hash[card.recipe]+=1
    end
    recipe_hash.max_by { |k, v| v }
  end

  def users
    list = []
    RecipeCard.all.each do |card|
      if card.recipe == self
        list << card.user
      end
    end
    list
  end

  def ingredients
    list = []
    RecipeIngredient.all.each do |r_ingredient|
      if r_ingredient.recipe == self
        list << r_ingredient.ingredient
      end
    end
    list
  end

  def allergens
    list = []
    self.ingredients.each do |ingr|
      Allergen.all.each do |allergen|
        if allergen.ingredient == ingr
          list << ingr
        end
      end
    end
    list
  end

  def add_ingredients(ingredient_list)
    ingredient_list.each { |ingredient| RecipeIngredient.new(ingredient, self) }
    self.ingredients
  end
end
