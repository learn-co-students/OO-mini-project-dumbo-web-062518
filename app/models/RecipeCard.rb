class RecipeCard
attr_reader :name, :user, :recipe, :date, :rating
@@all = []

def initialize(name, user, recipe, date, rating)
  @name = name
  @user = user
  @recipe = recipe
  @date = date
  @rating = rating

  @@all << self
end

def self.all
  @@all
end

# def date
#   @date
# end
#
# def rating
#   @rating
# end
#
# def user
#   #should return the user to which the entry belongs
# end
#
# def recipe
#   #return the recipe to which the entry belongs
# end

end
