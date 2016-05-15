
class Contestant
  attr_reader :name, :votes
  def initialize(name)
    @name = name
    @votes = 0
  end
  def to_s
    @name
  end
  def vote
    @vote += 1
  end
end
