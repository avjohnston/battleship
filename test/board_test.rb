require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'

class BoardTest < MiniTest::Test
  def test_it_exists
    board = Board.new
    assert_instance_of Board, board
  end

  def test_cells_exist
    board = Board.new
    assert_equal board.cells, board.cells
  end

  def test_if_cell_is_a_valid_coordinate
    board = Board.new
    assert_equal true, board.valid_coordinate?("A1")
  end


end
