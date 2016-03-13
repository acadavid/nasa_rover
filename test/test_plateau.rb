require 'minitest/autorun'
require 'plateau'
require 'rover'

class TestPlateau < Minitest::Test
  def setup
    @plateau = Plateau.new(10,10)
  end

  def test_position_valid?
    assert @plateau.position_valid?(0, 0)
    assert @plateau.position_valid?(5, 5)
    assert @plateau.position_valid?(9, 10)
    assert @plateau.position_valid?(10, 9)
  end

  def test_position_not_valid
    refute @plateau.position_valid?(9, 11)
    refute @plateau.position_valid?(11, 9)
  end

  def test_add_rover
    rover = Rover.new(1,1,"N", @plateau)
    @plateau.add_rover(rover)
    assert 1, @plateau.rovers.size
  end

  def teardown
    @plateau = nil
  end
end
