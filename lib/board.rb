require './lib/ship'
require './lib/cell'

class Board
  attr_reader :cells
  def initialize
    @key_letter = ["A", "B", "C", "D"]
    @key_number = ["1", "2", "3", "4"]
  end

  def cells
    cell_hash = Hash.new
    @key_number.each do |number|
      @key_letter.each do |letter|
        cell_hash[letter + number] = Cell.new(letter + number)
      end
    end
    cell_hash
  end

  def valid_coordinate?(cell)
    cells.keys.include?(cell)
  end

  def letters_array(coordinates)
    coordinates.map do |coordinate|
      coordinate[0]
    end
  end

  def numbers_array(coordinates)
    coordinates.map do |coordinate|
      coordinate[1].to_i
    end
  end

  def placed_horizontally?(coordinates)
    letters = letters_array(coordinates)
    letters.uniq.length == 1
  end

  def placed_vertically?(coordinates)
    numbers = numbers_array(coordinates)
    numbers.uniq.length == 1
  end

  def placed_consecutive_letters?(coordinates)
    letters_array(coordinates).each_cons(2).all? do |a, b|
      b.ord == a.ord + 1
    end
  end

  def placed_consecutive_numbers?(coordinates)
    numbers_array(coordinates).each_cons(2).all? do |a, b|
      b == a + 1
    end
  end

  def placed_consecutively(coordinates)
    return true if (placed_consecutive_numbers?(coordinates) == true && placed_consecutive_letters?(coordinates) == false) ||
    (placed_consecutive_numbers?(coordinates) == false && placed_consecutive_letters?(coordinates) == true)
    false
  end

  def ship_fits(ship, coordinates)
    ship.length == coordinates.length
  end

  def valid_placement?(ship, coordinates)
    return true if placed_consecutively(coordinates) == true && ship_fits(ship, coordinates) == true
    false
  end

  










end
