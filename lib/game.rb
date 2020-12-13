require './lib/board'
require './lib/ship'
require './lib/cell'

class Game
  attr_reader :player
              :computer
              :computer_submarine
              :user_submarine
              :computer_cruiser
              :user_cruiser

  def initialize
    @player = Board.new
    @computer = Board.new
    @computer_submarine = Ship.new("Submarine", 2)
    @user_submarine = Ship.new("Submarine", 2)
    @computer_cruiser = Ship.new("Cruiser", 3)
    @user_cruiser = Ship.new("Cruiser", 3)
  end

  def random_coordinate_generator(ship)
    array = []
    until @computer.valid_placement?(ship, array) == true do
      array = @computer.cells.keys.sample(ship.length)
    end
    array
  end

  def player_coordinates
    puts "I have laid out my ships on the grid."
    puts "You now need to lay out your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long."
    puts "1 2 3 4"
    puts "A . . . ."
    puts "B . . . ."
    puts "C . . . ."
    puts "D . . . ."
    puts "Enter the squares for the Cruiser (3 spaces):"
    print ">"
    until cell.split == valid_placement?(ship) do
      cell = gets.chomp
    end
    puts "Enter the squares for the Submarine (2 spaces):"





  end







  def main_menu
    "Welcome to BATTELSHIP \nEnter p to play. Enter q to quit."
    answer = gets.chomp.downcase
    if answer == 'p'

    else
      "Goodbye."
    end
  end

end
