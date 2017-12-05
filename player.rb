class Player

  # def name
  #   @name
  # end
  #
  # def name=(new_name)
  #   @name = new_name
  # end

  attr_accessor :name

  # def points
  #   @points
  # end

  attr_reader :points

  def initialize(name)
    @name = name
    @points = 0
  end

  def award_point
    @points += 1
  end

end