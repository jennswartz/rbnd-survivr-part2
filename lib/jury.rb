class Jury
  attr_accessor :members
  
  def initialize
    @members = []
  end
  
  def add_member(member)
    @members << member
  end
  
  def cast_votes(finalists)
	votes = Hash.new
	finalists.each { |finalist| votes[finalist] = 0 }
	@members.each do |member|
	  selection = finalists.sample
	  votes[selection] += 1
	  puts "#{member.name} voted for #{selection}."
	  end
	votes
  end
  
  def report_votes(votes)
    votes.each do |finalist, selection|
      puts "#{finalist.name} " + " received " + "#{selection}" + " vote(s)."
    end
  end  
  
  def announce_winner(votes)
    winner = votes.max_by { |finalist, selection| selection }.first 
    puts "#{winner.name} is the winner!" 
    winner
  end
end