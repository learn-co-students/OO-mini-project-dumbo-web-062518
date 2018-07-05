class Recipe

  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_popular
    #return the recipe instance(s) with the highest number of users (the recipe that has the most recipe cards)
    max_number = 0
    most_popular_recipe_array = []
    tested_recipe_array = Recipe.all.map do |this_recipe|
       RecipeCard.all.select do |recipecard|
         recipecard.recipe == this_recipe
       end
     end
     tested_recipe_array.each do |array|
       if array.length > max_number
         max_number = array.length
         most_popular_recipe_array.clear
         most_popular_recipe_array << array
       elsif array.length == max_number
         most_popular_recipe_array << array
       end
     end
     most_popular_recipe_array.map do |array|
       array[0].recipe
     end
  end

  def recipecards
    # should return all of the recipecards this recipe has
    RecipeCard.all.select do |recipecard|
      recipecard.recipe == self
    end
  end

  def users
    #should return the user instances who have recipe cards with this recipe
    recipecards.map {|recipecard| recipecard.user}
  end

  def ingredients
    #should return all of the ingredients in this recipe
    the_recipeingredients = RecipeIngredient.all.select do |recipeingredient|
      recipeingredient.recipe == self
    end
    the_recipeingredients.map do |recipeingredient|
      recipeingredient.ingredient
    end
  end

  def allergens
    #return all of the ingredients in this recipe that are allergens
    allergen_array = Allergen.all.map {|allergen| allergen.ingredient}

    self.ingredients.select do |ingredient|
      allergen_array.include?(ingredient)
    end
  end

  def add_ingredients (ingredient_array)
    #should take an array of ingredient instances as an argument, and associate each of those ingredients with this recipe
    ingredient_array.map do |ingredient|
      RecipeIngredient.new(self, ingredient)
    end
  end

end
