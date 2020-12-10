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

  def place_ship(boat)
    @ship = boat
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
    if user == true && fired_upon? == false && !empty?
      "S"
    elsif fired_upon? == true && empty? == true
      "M"
    elsif fired_upon? == true && @ship.sunk? == true
      "X"
    elsif fired_upon? == true && empty? == false
      "H"
    else fired_upon? == false
      "."
    end
  end

end
