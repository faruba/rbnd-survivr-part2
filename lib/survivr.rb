require "colorizr"
require_relative "game"
require_relative "tribe"
require_relative "contestant"
require_relative "jury"

#After your tests pass, uncomment this code below
#=========================================================
# Create an array of twenty hopefuls to compete on the island of Borneo
@contestants = %w(carlos walter aparna trinh diego juliana poornima juha sofia julia fernando dena orit colt zhalisa farrin muhammed ari rasha gauri)
@contestants.map!{ |contestant| Contestant.new(contestant) }.shuffle!

# Create two new tribes with names
@coyopa = Tribe.new(name: "Pagong", members: @contestants.shift(10))
@hunapu = Tribe.new(name: "Tagi", members: @contestants.shift(10))

# Create a new game of Survivor
@borneo = Game.new(@coyopa, @hunapu)
#=========================================================


#This is where you will write your code for the three phases
#It's really difficulty to understan this project .
#Intriduction, test suit, readme, rubric, I forgot how many times I have read.
#each one of them, I understood, but put them together, I lost.There must be something I misunderstood
#It's like a puzzle, some information hide in there.
#each test seems to tell a different story.
# if phase_one eliminate 8 people, how do I pass  test_individual_immunity_challenge?
#individual_immunity_challenge happend in phase two , so phase_one happend in Game.new. Am I right?
#this my answer:
#`class Game
#  attr_reader :tribes, :immunity_challenge 
#    def initialize(*tribe_list)
#        @tribes = tribe_list
#        immunity_challenge   << this is phase_one : kill 8 person ,merge into new Tribe
#             ........
#end
#but look at this test : it tells me that Game.new just init some variables. kill & merge happend in here -> phase_one
#ok , so   test_individual_immunity_challenge happend just after Game.new , but where is merged_tribe ? and I must
#return a instance of Contestant . don't tell me to return Contestant.new("Mr Void?!!")
#
#maybe you will agree with me, test tells us :
#1 how we use this class, and it's even better than documents
#2 making sure everything is right . good for refactor,checking some critcal conditions
#3 help us find a better desgin, maybe we don't know how to implement for now, but we do know how to use it.
#
#but after I read all of this test , I still didn't get your idea.
#Could you tell me a way to understand this project?
#tribe and jury ,this two class I can understand , tell me about game and survivr
#In order to submit project , I need to implment in different way to make test pass. 
def phase_one
# kill & merge happend in Game.new. sorry about that
  20 - @borneo.combined_tribe.members.length
end

def phase_two
  killed = []
  3.times do
    killed << @borneo.individual_immunity_challenge
  end
  killed.length
end

def phase_three
  7.times do
    @jury.add_member (@borneo.challenge)
  end
  @jury.members.length
end


# If all the tests pass, the code below should run the entire simulation!!
#=========================================================
phase_one #8 eliminations
@merge_tribe = @borneo.merge("Cello") # After 8 eliminations, merge the two tribes together
phase_two #3 more eliminations
@jury = Jury.new
phase_three #7 elminiations become jury members
finalists = @merge_tribe.members #set finalists
vote_results = @jury.cast_votes(finalists) #Jury members report votes
@jury.report_votes(vote_results) #Jury announces their votes
result = @jury.announce_winner(vote_results) #Jury announces final winner
puts "The winner iiiiisssssssss " + "#{result}".green_bg
