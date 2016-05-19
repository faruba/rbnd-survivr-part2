class Jury
  attr_accessor :members
  def initialize()
    @members = []
  end

  def add_member(member)
    @members << member
  end

  def cast_votes(name_list)
    # some thing like this does not work : ret = Hash name_list.map{ |name| [name,0]}
    # or ret = [name_list,Array.new(name_list.length,0)].to_h
    # I have to do like this
    ret = Hash.new
    name_list.each {|name| ret[name] = 0}

    @members.each{ |member|
      vote_to = name_list.sample
      ret[vote_to] += 1
      puts "#{member} vote to #{vote_to}"
    }
    return ret
  end
  def report_votes(result)
    result.each{|name, votes|
      puts "#{name} gets #{votes} votes"
    }
  end
  def announce_winner(result)
    max_votes = 0
    result.each{| member, votes|
      if(votes > max_votes)
        result = member
        max_votes = votes
      end
    }
    return  result
  end
end
