require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'

class GameTest < MiniTest::Test
<<<<<<< HEAD
=======

>>>>>>> a2cd41a8e166f86e16635a8bc1b9f4cffa62ef3c
  def test_it_exists
    game = Game.new
    assert_instance_of Game, game
  end

  def test_computer_picks_random_coordinates
<<<<<<< HEAD
    skip
    game = Game.new
    sub = Ship.new("Submarine", 2)
    cruiser = Ship.new("Cruiser", 3)
    assert_equal 0, game.random_coordinate_generator(sub)
    assert_equal 0, game.random_coordinate_generator(cruiser)
  end

  def test_computer_picks_random_coordinates
    skip
    game = Game.new
    sub = Ship.new("Submarine", 2)
    cruiser = Ship.new("Cruiser", 3)
    assert_equal 0, game.computer_coordinates
  end

  def test_

  end

end
=======
    game = Game.new
    sub = Ship.new("Submarine", 2)
    cruiser = Ship.new("Cruiser", 3)
    assert_equal 2, game.random_coordinate_generator(sub)
    assert_equal 2, game.random_coordinate_generator(cruiser)
  end

end 
>>>>>>> a2cd41a8e166f86e16635a8bc1b9f4cffa62ef3c
