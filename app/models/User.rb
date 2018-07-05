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

  def recipecards
    # should return all of the recipecards this user has
    RecipeCard.all.select do |recipecard|
      recipecard.user == self
    end
  end

  def recipes
    #return all of the recipes this user has recipe cards for
    recipecards.map {|recipecard| recipecard.recipe}
  end

  def add_recipe_card (recipe_object, rating)
    # should accept a recipe instance as an argument, as well as a date and rating, and create a new recipe card for this user and the given recipe
    RecipeCard.new(self, recipe_object, rating)
  end

  def declare_allergen (ingredient_object)
    #accept an ingredient instance as an argument, and create a new allergen instance for this user and the given ingredient
    Allergen.new(self, ingredient_object)
  end

  def allergens
    #should return all of the ingredients this user is allergic to
    allergen_objects = Allergen.all.select do |allergen|
      allergen.user == self
    end
    allergen_objects.map do |allergen|
      allergen.ingredient
    end
  end

  def top_three_recipes
    # should return the top three highest rated recipes for this user.
    sorted_recipes = self.recipecards.sort_by do |recipecard|
      recipecard.rating
    end
    sorted_recipes.reverse.first(3).map {|recipecard| recipecard.recipe}
  end

  def most_recent_recipe
    #should return the recipe most recently added to the user's cookbook
    sorted_recipes = self.recipecards.sort_by do |recipecard|
      recipecard.date
    end
    sorted_recipes.reverse.first(1)[0].recipe
  end

  def safe_recipes
    #should return all recipes that do not contain ingredients the user is allergic to
    the_safe_recipes = []

    Recipe.all.select do |recipe|

      test_array = recipe.ingredients.map do |ingredient|
        !(self.allergens.include?(ingredient))
      end
      if test_array.include?(false)
      else
        the_safe_recipes << recipe
      end

    end
    the_safe_recipes
  end

end
