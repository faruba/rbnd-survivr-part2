class Jury
  attr_accessor :members
  def initialize()
    @members = []
  end

  def add_member(member)
    @members << member
  end

  def cast_votes(name_list)
    #awesome !
    ret = Hash[name_list.collect { |name| [name, 0] }]

    @members.each{ |member|
      vote_to = name_list.sample
      ret[vote_to] += 1
      puts "#{member}".yellow  + " vote to " + "#{vote_to}".green
    }
    return ret
  end
  def report_votes(result)
    result.each{|name, votes|
      puts "#{name}".blue + " gets " + "#{votes}".cyan + " votes"
    }
  end
  def announce_winner(result)
    #awesome !
    result.max_by{ | member, votes| votes}[0]
  end
end
