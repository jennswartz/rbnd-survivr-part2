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
  
  def merge(new_tribe)
    contestants = tribes.map(&:members).flatten
    merged_tribe = Tribe.new(name: new_tribe, members: contestants)
    clear_tribes
    add_tribe(merged_tribe)
    merged_tribe
  end
  
  def individual_immunity_challenge
    immune = @tribes[0].members.sample
    return immune
  end
end