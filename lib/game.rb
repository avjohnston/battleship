class Game
  attr_reader :player,
              :computer,
              :computer_submarine,
              :user_submarine,
              :computer_cruiser,
              :user_cruiser

  def initialize
    @player = Board.new
    @computer = Board.new
    @computer_submarine = Ship.new("Submarine", 2)
    @user_submarine = Ship.new("Submarine", 2)
    @computer_cruiser = Ship.new("Cruiser", 3)
    @user_cruiser = Ship.new("Cruiser", 3)
  end


  def computer_random_coordinates(ship)
    cells = []
    until @computer.valid_placement?(ship, cells) 
      cells = []
      ship.length.times do
        cells << @computer.cells.keys.sample
      end
    end
    cells
  end

  def place_computer_ship(ship)
    @computer.place(ship, computer_random_coordinates(ship))
  end

  def player_coordinates
    puts "I have laid out my ships on the grid."
    puts "You now need to lay out your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long."
    puts "  1 2 3 4"
    puts "A . . . ."
    puts "B . . . ."
    puts "C . . . ."
    puts "D . . . ."
    puts "Enter the squares for the Cruiser (3 spaces):"
    print ">"

    until cell.split == valid_placement?(ship)
      cell = get.chomp
    end
  end








  def main_menu
    "Welcome to BATTLESHIP"
    "Enter p to play. Enter q to quit."
    answer = gets.chomp.downcase
    if answer == "p"

    else
      "Goodbye."
    end
  end


end
