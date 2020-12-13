require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'

class GameTest < MiniTest::Test
  def test_it_exists
    game = Game.new
    assert_instance_of Game, game
  end

  def test_computer_picks_random_coordinates
    # skip
    game = Game.new
    sub = Ship.new("Submarine", 2)
    cruiser = Ship.new("Cruiser", 3)
    # require'pry';binding.pry
    # assert_equal 0, game.random_coordinate_generator(sub)
    assert_equal 0, game.random_coordinate_generator(cruiser)
  end







  def test_computer_picks_random_coordinatesXXXXX
    skip
    game = Game.new
    sub = Ship.new("Submarine", 2)
    cruiser = Ship.new("Cruiser", 3)
    assert_equal 0, game.random_coords
  end

end
