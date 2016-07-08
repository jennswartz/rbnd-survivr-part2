class Game
  attr_reader :tribes

  def initialize(*tribes)
    @tribes = tribes
  end
  
  def add_tribe(tribe)
    @tribes << tribe
  end
  
  def immunity_challenge
    @tribes.sample
  end
  
  def clear_tribes
    @tribes.clear
  end
  
  def merge(tribe)
    contestants = tribes.map(&:members).flatten
    merged_tribe = Tribe.new(name: "New Merged Tribe", members: contestants)
    self.clear_tribes
    self.add_tribe(merged_tribe)
    merged_tribe
  end
  
  def individual_immunity_challenge
    @tribes[0].members.sample
  end
  
end