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
    game = Game.new
    sub = Ship.new("Submarine", 2)
    assert_equal 2, game.computer_random_coordinates(sub)
  end
end
