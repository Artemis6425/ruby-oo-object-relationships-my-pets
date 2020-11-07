class Owner
  # code goes here
  @@all = []
  def initialize(name)
    @name = name
    @species = "human"
    @cats = []
    @dogs = []
    @@all << self
  end
  attr_reader :name, :species, :cats, :dogs
  def buy_cat(name)
    temp = Cat.new(name, self)
    @cats << temp
  end
  def cats
    Cat.all.select {|cat| cat.owner == self}
  end
  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end
  def buy_dog(name)
    temp = Dog.new(name, self)
    @dogs << temp
  end
  def self.all
    @@all
  end
  def say_species
    return "I am a human."
  end
  def self.count
    @@all.length
  end
  def list_pets
    return "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
  def walk_dogs
    dogs.map {|dog| dog.mood = "happy"}
  end
  def feed_cats
    cats.map {|cat| cat.mood = "happy"}
  end
  def sell_pets
    dogs.map {|dog| dog.mood = "nervous"}
    dogs.map {|dog| dog.owner = nil}
    cats.map {|cat| cat.mood = "nervous"}
    cats.map {|cat| cat.owner = nil}
    @cats = []
    @dogs = []
  end
  def self.reset_all
    @@all = []
  end
end