class Dog
  # code goes here
  @@all = []
  def initialize(name, owner)
    @name = name
    @owner = owner
    @mood = "nervous"
    @@all << self
  end
  attr_accessor :owner, :mood
  attr_reader :name
  def self.all
    @@all
  end
end