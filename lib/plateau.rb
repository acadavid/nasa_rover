class Plateau
  attr_accessor :max_x, :max_y, :rovers

  def initialize(x, y)
    @max_x = x
    @max_y = y
    @rovers = []
  end

  def position_valid?(x, y)
    x <= @max_x && y <= @max_y
  end

  def add_rover(rover)
    @rovers << rover
  end
end
