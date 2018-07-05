class Ingredient

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_common_allergen
    #should return the ingredient instance that the highest number of users are allergic to
    max_number = 0
    most_common_allergen_array = []
    sorted_allergen_array = Ingredient.all.map do |this_ingredient|
       Allergen.all.select do |allergen|
         allergen.ingredient == this_ingredient
       end
    end.delete_if {|i| i==[]}
    sorted_allergen_array.each do |array|
       if array.length > max_number
         max_number = array.length
         most_common_allergen_array.clear
         most_common_allergen_array << array
       elsif array.length == max_number
         most_common_allergen_array << array
       end
     end
     most_common_allergen_array.map do |array|
       array[0].ingredient
     end
  end

end
