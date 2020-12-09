class Cell
  attr_reader :coordinate,
              :ship
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
  end

  def empty?
    @ship.nil?
  end

  def place_ship(cruiser)
    @ship = cruiser
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    if @ship != nil
      @ship.hit
      @fired_upon = true
    end
  end

  def render(user = false)
    if fired_upon? == false
      "."
    elsif fired_upon? == true && empty? == true
      "M"
    elsif fired_upon? == true && empty? == false
      "H"
    else fired_upon? == true && @ship.sunk? == true
      "X"
    end

  end

end
