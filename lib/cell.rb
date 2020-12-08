require './lib/ship'

class Cell
  attr_reader :coordinate
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = []
  end

  def empty?
    return true if @ship.length == 0
    false
  end

  def place_ship(cruiser)
    @ship << cruiser
  end

  def ship
    @ship
  end

  def fired_upon?
    return false if @health == @length
    true
  end

  def fire_upon
    if @ship.length != 0

    else
    end
  end

end
