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

  def test_computer_coordinates
    game = Game.new
    player = Board.new
    computer = Board.new
    computer_submarine = Ship.new("Submarine", 2)
    user_submarine = Ship.new("Submarine", 2)
    computer_cruiser = Ship.new("Cruiser", 3)
    user_cruiser = Ship.new("Cruiser", 3)
    expected = game.random_coordinate_generator(computer_submarine)
    assert_equal true, computer.valid_placement?(computer_submarine, expected)
  end
end
