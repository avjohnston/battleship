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
end
