class Allergen
  attr_accessor :user, :ingredient
  @@all = []

  def initialize(ingredient)
    @@all << self
    @ingredient = ingredient
  end

  def self.all
    @@all
  end

end
