
class Tribe
  attr_reader :name, :members
  def initialize(option = {})
    @name = option[:name]
    @members = option[:members]
    puts "new Tribe #{@name}"
  end

  def to_s
    @name
  end
  def tribal_council(options = {})
    #sorry about that I don't know what "Tribal Council" is
    #I read introduction many times, but still don't know how to eliminate one:
    #random pick ,the first one ,the last one or something else. shouldn't this details be described in
    #introduction or test_suit ?
    #this one is  working, but I'm not sure it is what you want
    @members.shuffle!
    first = @members.pop
    if(first == options[:immune])
      @members.insert(0,first)
      first = @members.pop
    end
    return first
  end
end
