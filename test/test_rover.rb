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

  def teardown
    @rover = nil
    @plateau = nil
  end
end
