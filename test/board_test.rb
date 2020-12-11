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

    expected = {
      "A1" => Cell.new("A1"),
      "A2" => Cell.new("A2"),
      "A3" => Cell.new("A3"),
      "A4" => Cell.new("A4"),
      "B1" => Cell.new("B1"),
      "B2" => Cell.new("B2"),
      "B3" => Cell.new("B3"),
      "B4" => Cell.new("B4"),
      "C1" => Cell.new("C1"),
      "C2" => Cell.new("C2"),
      "C3" => Cell.new("C3"),
      "C4" => Cell.new("C4"),
      "D1" => Cell.new("D1"),
      "D2" => Cell.new("D2"),
      "D3" => Cell.new("D3"),
      "D4" => Cell.new("D4"),
    }
    assert_equal 16, board.cells.size
    assert_equal board.cells, board.cells
  end

  def test_if_cell_is_a_valid_coordinate
    board = Board.new
    assert_equal true, board.valid_coordinate?("A1")
    assert_equal true, board.valid_coordinate?("D4")
    assert_equal false, board.valid_coordinate?("A5")
    assert_equal false, board.valid_coordinate?("E1")
    assert_equal false, board.valid_coordinate?("A22")
  end

  def test_that_coordinates_are_placed_horizontally
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    assert_equal false, board.placed_horizontally?(["A1", "B1"])
    assert_equal true, board.placed_horizontally?(["A1", "A2"])
  end

  def test_that_coordinates_are_placed_vertically
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    assert_equal true, board.placed_vertically?(["A1", "B1"])
    assert_equal false, board.placed_vertically?(["A1", "A2"])
  end

  def test_placed_consecutive_letters?
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    assert_equal false, board.placed_consecutive_letters?(["A1", "A2"])
    assert_equal true, board.placed_consecutive_letters?(["A1", "B1"])
  end

  def test_placed_consecutive_numbers?
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    assert_equal true, board.placed_consecutive_numbers?(["A1", "B2"])
    assert_equal false, board.placed_consecutive_numbers?(["A1", "B1"])
  end

  def test_valid_coordinate?
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    assert_equal false, board.valid_placement?(cruiser, ["A1", "A2", "A4"])
    assert_equal false, board.valid_placement?(submarine, ["A1", "C1"])
    assert_equal false, board.valid_placement?(cruiser, ["A3", "A2", "A1"])
    assert_equal false, board.valid_placement?(submarine, ["C1", "B1"])
    # assert_equal false, board.valid_placement?(cruiser, ["A1", "B2", "C3"])
    # assert_equal false, board.valid_placement?(submarine, ["C2", "D3"])
  end
end