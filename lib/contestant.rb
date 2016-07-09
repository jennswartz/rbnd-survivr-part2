class Contestant
  attr_reader :name
  
  def initialize(name)
    @name = name.capitalize
  end
  
  def to_s
    @name
  end
end