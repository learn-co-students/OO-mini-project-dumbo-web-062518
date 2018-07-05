class User
  @@all = []

  attr_reader :name

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def recipes
    list = []
    RecipeCard.all.each do |card|
      if card.user == self
        list << card.recipe
      end
    end
    list
  end

  def add_recipe_card(recipe, date, rating)
    RecipeCard.new(recipe, date, rating, self)
  end

  def declare_allergen(ingredient)
    Allergen.new(self, ingredient)
  end

  def allergens
    list = Allergen.all.select { |allergen| allergen.user == self }
  end

  def top_three_recipes
    user_recipes = RecipeCard.all.select { |card| card.user == self }

    sorted_list = user_recipes.sort { |x,y| y.rating <=> x.rating }

    sorted_list[0..2]
  end

  def most_recent_recipe
    list = RecipeCard.all.select { |card| card.user == self }
    list.last
  end

  def safe_recipes
    list = []
    allergens.each do |allergen|
      RecipeIngredient.all.each do |r_ingr|
          unless allergen.ingredient == r_ingr.ingredient
            list << r_ingr.recipe
          end
      end
    end
    list.uniq
  end
end
