require 'minitest/autorun'
require 'plateau'
require 'rover'
require 'byebug'

class TestRover < Minitest::Test
  def setup
    @plateau = Plateau.new(10,10)
    @rover = Rover.new(5,5,"N", @plateau)
    @plateau.add_rover(@rover)
  end

  def test_spin_ninty_degrees_left
    @rover.spin_ninty_degrees_left
    assert_equal @rover.heading, "W"
  end

  def test_spin_ninty_degrees_right
    @rover.spin_ninty_degrees_right
    assert_equal @rover.heading, "E"
  end

  def test_double_right_spin
    @rover.spin_ninty_degrees_right
    @rover.spin_ninty_degrees_right
    assert_equal @rover.heading, "S"
  end

  def test_move_forward_facing_north
    @rover.move_forward
    assert_equal @rover.pos_x, 5
    assert_equal @rover.pos_y, 6
  end

  def test_edge_move_forward
    @rover.pos_x = 10
    @rover.pos_y = 10

    @rover.move_forward
    assert_equal @rover.pos_x, 10
    assert_equal @rover.pos_y, 10
  end

  def test_execute_movements_north_then_south
    movements = "MMLL"
    @rover.execute_movements(movements)
    assert_equal 5,@rover.pos_x
    assert_equal 7,@rover.pos_y
    assert_equal "S",@rover.heading
  end

  def test_execute_movements_south_then_east
    movements = "RRMML"
    @rover.execute_movements(movements)
    assert_equal 5,@rover.pos_x
    assert_equal 3,@rover.pos_y
    assert_equal "E",@rover.heading
  end

  def test_execute_movements_west_then_north
    movements = "LMMR"
    @rover.execute_movements(movements)
    assert_equal 3,@rover.pos_x
    assert_equal 5,@rover.pos_y
    assert_equal "N",@rover.heading
  end

  def test_execute_movements_east_then_west
    movements = "RMMLL"
    @rover.execute_movements(movements)
    assert_equal 7,@rover.pos_x
    assert_equal 5,@rover.pos_y
    assert_equal "W",@rover.heading
  end

  def test_execute_movements
    movements = "MMRMRRLMMRMRMLMML"
    @rover.execute_movements(movements)
    assert_equal 3,@rover.pos_x
    assert_equal 6,@rover.pos_y
    assert_equal "S",@rover.heading
  end

  def teardown
    @rover = nil
    @plateau = nil
  end
end
