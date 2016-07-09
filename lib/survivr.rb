require 'colorizr'

require_relative "game"
require_relative "tribe"
require_relative "contestant"
require_relative "jury"

#After your tests pass, uncomment this code below
#=========================================================
#Create an array of twenty hopefuls to compete on the island of Borneo
@contestants = %w(carlos walter aparna trinh diego juliana poornima juha sofia julia fernando dena orit colt zhalisa farrin muhammed ari rasha gauri)
@contestants.map!{ |contestant| Contestant.new(contestant) }.shuffle!

#Create two new tribes with names
@coyopa = Tribe.new(name: "Pagong", members: @contestants.shift(10))
@hunapu = Tribe.new(name: "Tagi", members: @contestants.shift(10))

#Create a new game of Survivor
@borneo = Game.new(@coyopa, @hunapu)
#=========================================================


#This is where you will write your code for the three phases
def phase_one
  puts "Get ready to start Part 1.".light_grey
  sleep(1)
  puts "Each Tribe will participate in an immunity challenge.".light_grey
  sleep(1)
  puts "The losing Tribe will then vote someone off the island.".light_grey
  sleep(1)
  8.times do 
	#Sets variable for tribe loser of immunity challege
	losing_tribe = @borneo.immunity_challenge 
	puts "#{losing_tribe} ".red + "has lost the challenge and will vote someone off the island."
	sleep(2)
	#Losing tribe holds tribal council and votes off member
	member_voted_off = losing_tribe.tribal_council
	#Deletes losing tribe member 
	losing_tribe.delete(member_voted_off)  
	puts "Sadly, " + "#{member_voted_off} ".green + "has been voted off the island."	
	sleep(2)
  end
end

def phase_two
  puts "The tribes have merged, and it is time to start Part 2 of the fabulous game Survivr!".light_grey
  sleep(1)
  3.times do
    #Determines winner of immunity challenge
    immune = @borneo.individual_immunity_challenge 
    puts "Wow! " +"#{immune} ".yellow + "has won the challenge and has immunity!"
    sleep(2)
    #Hold tribal council for merged tribe; immune can't be voted off
    member_voted_off = @merge_tribe.tribal_council(immune: immune) 
    #Delete voted off member from merged tribe
    @merge_tribe.delete(member_voted_off) 
    puts "Unfortunately, " + "#{member_voted_off} ".blue + "has been voted off the island."
    sleep(2)
  end
end

def phase_three
  puts "It is time for the last part of the game!".light_grey
  sleep(1)
  7.times do
    #Pick winner of immunity challenge
    immune = @borneo.individual_immunity_challenge 
    puts "#{immune} ".pink + "has won the immunity challenge!"
    sleep(2)
    #Vote off one person; immune person must stay
    member_voted_off = @merge_tribe.tribal_council(immune: immune) 
    #Delete voted off person from tribe
    @merge_tribe.delete(member_voted_off)
    #Add voted off person to jury 
    @jury.add_member(member_voted_off) 
    puts "Goodbye, " + "#{member_voted_off}. ".yellow + "You have been voted off the island."
    sleep(2)
  end
end


# If all the tests pass, the code below should run the entire simulation!!
#=========================================================
phase_one #8 eliminations
@merge_tribe = @borneo.merge("Cello") # After 8 eliminations, merge the two tribes together
phase_two #3 more eliminations
@jury = Jury.new
phase_three #7 eliminiations become jury members
finalists = @merge_tribe.members #set finalists
puts "It is time for the final vote.".light_blue
sleep(1)
vote_results = @jury.cast_votes(finalists) #Jury members report votes
@jury.report_votes(vote_results) #Jury announces their votes
@jury.announce_winner(vote_results) #Jury announces final winner
