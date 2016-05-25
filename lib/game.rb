
class Game
  attr_reader :tribes
  def initialize(*tribe_list)
    @tribes = tribe_list
  end
  def add_tribe(tribe)
    @tribes << tribe
  end
  def clear_tribes
    @tribes = []
  end
  def immunity_challenge  
    @tribes.sample
  end
  def merge(tribe_name) 
    contestants = @tribes.reduce([]) {|acc, tribe| acc + tribe.members }
    combined_tribe = Tribe.new({name:tribe_name, members:contestants})
    clear_tribes
    add_tribe(combined_tribe)
    combined_tribe
  end
  def individual_immunity_challenge
    @last_immunity = @tribes.first.members.sample
    challenge
  end
  def challenge
    @tribes.first.tribal_council(immune: @last_immunity)
  end
end
