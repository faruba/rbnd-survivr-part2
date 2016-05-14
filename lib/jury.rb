class Jury
  attr_reader :members
  def initialize()
    @members =[]
  end

  def add_member(member)
    @members << member
  end
end
