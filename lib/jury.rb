require 'colorizr'

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
	  puts "#{member.name} ".red + "voted for " + "#{selection}.".blue
	  sleep(1)
	  votes[selection] += 1
	end
	votes
  end
  
  def report_votes(votes)
    votes.each do |finalist, selection|
      puts "#{finalist.name} ".pink + "received #{selection} vote(s).".yellow
      sleep(1)
    end
  end  
  
  def announce_winner(votes)
    winner = votes.max_by { |finalist, selection| selection }.first 
    puts "#{winner.name} ".green + "is the " + "WINNER!".red 
    winner
  end
end