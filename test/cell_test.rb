require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'

class CellTest < MiniTest::Test
  def test_it_exists
    cell = Cell.new("B4")
    assert_instance_of Cell, cell
  end

  def test_it_has_a_coordinate
    cell = Cell.new("B4")
    assert_equal "B4", cell.coordinate
  end

  def test_it_has_a_ship
    cell = Cell.new("B4")
    assert_nil nil, cell.ship
  end

  def test_the_cell_is_empty
    cell = Cell.new("B4")
    assert_equal true, cell.empty?
  end

  def test_ship_is_placed
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    assert_equal cruiser, cell.ship
  end

  def test_cell_isnt_empty
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    assert_equal false, cell.empty?
  end

  def test_cell_hasnt_been_fired_on
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    assert_equal false, cell.fired_upon?
  end

  def test_we_can_fire_upon_a_cell
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    cell.fire_upon
    assert_equal 2, cell.ship.health
    assert_equal true, cell.fired_upon?
  end

  def test_render_for_period
    cruiser = Ship.new("Cruiser", 3)
    cell_1 = Cell.new("B4")
    assert_equal ".", cell_1.render
  end

  def test_render_for_miss
    cruiser = Ship.new("Cruiser", 3)
    cell_1 = Cell.new("B4")
    cell_1.fire_upon
    assert_equal "M", cell_1.render
  end

  def test_render_for_hit
    cruiser = Ship.new("Cruiser", 3)
    cell_1 = Cell.new("B4")
    cell.place_ship(cruiser)
    cell_1.fire_upon
    assert_equal "H", cell_1.render
  end

  def test_render_for_sunk
    cruiser = Ship.new("Cruiser", 1)
    cell_1 = Cell.new("B4")
    cell.place_ship(cruiser)
    cell_1.fire_upon
    assert_equal "X", cell_1.render
  end

  def test_render_for_s
    cruiser = Ship.new("Cruiser", 1)
    cell_1 = Cell.new("B4")
    cell.place_ship(cruiser)

    assert_equal "S", cell_1.render(true)
  end

end
