class Cell
  attr_reader :coordinate,
              :ship
  def initialize(coordinate)
    @coordinate = coordinate
    @ship       = nil
    @fired_upon = false
  end

  def empty?
    @ship.nil?
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    if @ship != nil
      @ship.hit
    end
      @fired_upon = true
  end

  def render(user = false)
    if fired_upon? && empty?
      "M"
    elsif fired_upon?  && @ship.sunk?
      "X"
    elsif fired_upon?  && !empty?
      "H"
    elsif user  && !fired_upon?  && !empty?
      "S"
    else
      "."
    end
  end
end
