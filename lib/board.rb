require './lib/ship'
require './lib/cell'

class Board
  attr_reader :cells
  def initialize
    @key_letter = ["A", "B", "C", "D"]
    @key_number = ["1", "2", "3", "4"]
    @cells = {
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
  end

  # def cells
  #   cell_hash = Hash.new
  #   @key_number.each do |number|
  #     @key_letter.each do |letter|
  #       cell_hash[letter + number] = Cell.new(letter + number)
  #     end
  #   end
  #   cell_hash
  # end


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
    return true if (placed_consecutive_numbers?(coordinates) == true && letters_array(coordinates).uniq.length == 1) ||
    (numbers_array(coordinates).uniq.length == 1 && placed_consecutive_letters?(coordinates) == true)
    false
  end

  def ship_fits(ship, coordinates)
    ship.length == coordinates.length
  end

  def valid_placement?(ship, coordinates)
    return true if placed_consecutively(coordinates) && ship_fits(ship, coordinates) && cell_is_empty?(coordinates)
    false
  end

  def place(ship, coordinates)
    coordinates.map do |coordinate|
      @cells[coordinate].place_ship(ship)
    end
  end

  def cell_is_empty?(coordinates)
    coordinates.all? do |coordinate|
      @cells[coordinate].empty?
    end
  end

  def render(user = false)
    if user == true
      "  1 2 3 4 \nA #{@cells["A1"].render(true)} #{@cells["A2"].render(true)} #{@cells["A3"].render(true)} #{@cells["A4"].render(true)}\nB #{@cells["B1"].render(true)} #{@cells["B2"].render(true)} #{@cells["B3"].render(true)} #{@cells["B4"].render(true)}\nC #{@cells["C1"].render(true)} #{@cells["C2"].render(true)} #{@cells["C3"].render(true)} #{@cells["C4"].render(true)}\nD #{@cells["D1"].render(true)} #{@cells["D2"].render(true)} #{@cells["D3"].render(true)} #{@cells["D4"].render(true)}\n"
    else
      "  1 2 3 4 \nA #{@cells["A1"].render} #{@cells["A2"].render} #{@cells["A3"].render} #{@cells["A4"].render}\nB #{@cells["B1"].render} #{@cells["B2"].render} #{@cells["B3"].render} #{@cells["B4"].render}\nC #{@cells["C1"].render} #{@cells["C2"].render} #{@cells["C3"].render} #{@cells["C4"].render}\nD #{@cells["D1"].render} #{@cells["D2"].render} #{@cells["D3"].render} #{@cells["D4"].render}\n"
    end
  end
end
