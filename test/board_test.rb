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

    assert_equal 16, expected.length

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
    assert_equal false, board.valid_placement?(cruiser, ["A1", "B2", "C3"])
    assert_equal false, board.valid_placement?(submarine, ["C2", "D3"])
    assert_equal true, board.valid_placement?(submarine, ["A1", "A2"])
    assert_equal true, board.valid_placement?(cruiser, ["B1", "C1", "D1"])
  end

  def test_we_can_place_a_ship
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["A1", "A2", "A3"])
    cell_1 = board.cells["A1"]
    cell_2 = board.cells["A2"]
    cell_3 = board.cells["A3"]
    assert_equal cruiser, cell_1.ship
    assert_equal cruiser, cell_2.ship
    assert_equal cruiser, cell_3.ship
    assert_equal true, cell_3.ship == cell_2.ship
  end

  def test_ships_cant_overlap
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["A1", "A2", "A3"])
    submarine = Ship.new("Submarine", 2)
    assert_equal false, board.valid_placement?(submarine, ["A1", "B1"])
  end

  def test_renders_board
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["A1", "A2", "A3"])
    computer_board = " 1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . ."
    user_board = " 1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . ."
    assert_equal computer_board, board.render
    assert_equal user_board, board.render(true)
  end

  def test_board_renders_M
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["A1", "A2", "A3"])
    board.cells["B1"].fire_upon
    missed_board = " 1 2 3 4 \nA . . . . \nB M . . . \nC . . . . \nD . . . . "
    assert_equal missed_board, board.render
  end

  def test_board_renders_H
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["A1", "A2", "A3"])
    board.cells["A1"].fire_upon
    missed_board = " 1 2 3 4 \nA H . . . \nB . . . . \nC . . . . \nD . . . . "
    assert_equal missed_board, board.render
    assert_equal missed_board, board.render(true)
  end

  def test_board_renders_X
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["A1", "A2", "A3"])
    board.cells["A1"].fire_upon
    board.cells["A2"].fire_upon
    board.cells["A3"].fire_upon
    missed_board = " 1 2 3 4 \nA X X X . \nB . . . . \nC . . . . \nD . . . . "
    assert_equal missed_board, board.render
    assert_equal missed_board, board.render(true)
  end
end
