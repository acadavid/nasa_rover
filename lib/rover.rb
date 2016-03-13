class Rover

  attr_accessor :pos_x, :pos_y, :heading, :plateau

  def initialize(x, y, heading, plateau)
    @pos_x = x || 0
    @pos_y = y || 0
    @heading = heading || "N"
    @plateau = plateau
  end

  def move_forward
    case @heading
    when "N"
      @pos_y += 1 if @plateau.position_valid?(@pos_x, @pos_y+1)
    when "S"
      @pos_y -= 1 if @plateau.position_valid?(@pos_x, @pos_y-1)
    when "E"
      @pos_x += 1 if @plateau.position_valid?(@pos_x+1, @pos_y)
    when "W"
      @pos_x -= 1 if @plateau.position_valid?(@pos_x-1, @pos_y)
    end
  end

  def spin_ninty_degrees_left
    raise "ERROR: No default heading direction" if @heading.empty?
    case @heading
    when "N"
      nh = "W"
    when "W"
      nh = "S"
    when "S"
      nh = "E"
    when "E"
      nh = "N"
    end
    @heading = nh
  end

  def spin_ninty_degrees_right
    raise "ERROR: No default heading direction" if @heading.empty?
    case @heading
    when "N"
      nh = "E"
    when "E"
      nh = "S"
    when "S"
      nh = "W"
    when "W"
      nh = "N"
    end
    @heading = nh
  end

end
