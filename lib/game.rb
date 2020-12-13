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

  def computer_coordinates
    @computer.place(@computer_cruiser, random_coordinate_generator(@computer_cruiser))
    @computer.place(@computer_submarine, random_coordinate_generator(@computer_submarine))
  end

  def player_coordinates
    puts "\nI have laid out my ships on the grid."
    puts "You now need to lay out your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long."
    puts "  1 2 3 4"
    puts "A . . . ."
    puts "B . . . ."
    puts "C . . . ."
    puts "D . . . ."
        # asking for cruiser placement
    puts "\nEnter the squares for the Cruiser (3 spaces):"
    print ">"
    cell = gets.chomp.upcase.split
    until @player.valid_placement?(@user_cruiser, cell)
      puts "Those are invalid coordinates. Please try again:"
      print ">"
      cell = gets.chomp.upcase.split
    end
    cell
    # require'pry';binding.pry
    @player.place(@user_cruiser, cell)
    @player.render(true)
    # asking for submarine placement
    puts "\nEnter the squares for the Submarine (2 spaces):"
    print ">"
    cell2 = gets.chomp.upcase.split
    until @player.valid_placement?(@user_submarine, cell2)
      puts "Those are invalid coordinates. Please try again:"
      print ">"
      cell2 = gets.chomp.upcase.split
    end
    cell2
    @player.place(@user_submarine, cell2)
    @player.render(true)
  end

  def player_shot
    puts "\nEnter the coordinate for your shot:"
    print ">"
    shot = gets.chomp.upcase.to_s
    until (@computer.valid_coordinate?(shot) == true) && (@computer.cells[shot].fired_upon? == false)
      puts "Please enter a valid coordinate:"
      print ">"
      shot = gets.chomp.upcase
    end
    @computer.cells[shot].fire_upon

    if @computer.cells[shot].empty? == true
      puts "\nMy shot on #{shot} was a miss."
    elsif @computer.cells[shot].empty? == false && @computer.cells[shot].ship.sunk? == true
      puts "\nMy shot on #{shot} was a hit. I have sunk one of the computer's ships!"
    elsif @computer.cells[shot].empty? == false
      puts "\nMy shot on #{shot} was a hit."
    end
  end

  def computer_shot
    array = []
    until @player.valid_coordinate?(array) == true && @player.cells[array].fired_upon? == false do
      array = @player.cells.keys.sample
    end
    array
    @player.cells[array].fire_upon

    if @player.cells[array].empty? == true
      puts "The computer's shot on #{array} was a miss.\n"
    elsif @player.cells[array].empty? == false && @player.cells[array].ship.sunk? == true
      puts "The computer's shot on #{array} was a hit. The computer has sunk one of your ships!\n"
    elsif @player.cells[array].empty? == false
      puts "The computer's shot on #{array} was a hit.\n"
    end
  end

  def turn
    puts "===Computer Board==="
    puts @computer.render
    puts "====Player Board===="
    puts @player.render(true)
    puts "\n"

    player_shot
    computer_shot
    puts "\n"
  end

  def computer_lose
    return true if (@computer_cruiser.sunk? == true && @computer_submarine.sunk? == true)
    false
  end

  def player_lose
    return true if (@user_cruiser.sunk? == true && @user_submarine.sunk? == true)
    false
  end

  def winner
    until computer_lose == true || player_lose == true
      turn
    end
    if computer_lose == true
      puts "===Computer Board==="
      puts @computer.render
      puts "====Player Board===="
      puts @player.render(true)
      puts "\n"
      puts "I won!"
    else player_lose == true
      puts "===Computer Board==="
      puts @computer.render
      puts "====Player Board===="
      puts @player.render(true)
      puts "\n"
      puts "The computer has won!"
    end
  end

  def main_menu
    puts "Welcome to BATTELSHIP \nEnter p to play. Enter q to quit."
    print ">"
    answer = gets.chomp.upcase.downcase
    if answer == 'p'
      player_coordinates
    else
      "Goodbye."
    end
  end

end
