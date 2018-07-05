class Allergen
  attr_accessor :name, :user
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

end
