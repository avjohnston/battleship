<<<<<<< HEAD
require './lib/board'
require './lib/ship'
require './lib/cell'

class Game
  attr_reader :player
              :computer
              :computer_submarine
              :user_submarine
              :computer_cruiser
=======
class Game
  attr_reader :player,
              :computer,
              :computer_submarine,
              :user_submarine,
              :computer_cruiser,
>>>>>>> a2cd41a8e166f86e16635a8bc1b9f4cffa62ef3c
              :user_cruiser

  def initialize
    @player = Board.new
    @computer = Board.new
    @computer_submarine = Ship.new("Submarine", 2)
    @user_submarine = Ship.new("Submarine", 2)
    @computer_cruiser = Ship.new("Cruiser", 3)
<<<<<<< HEAD
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
    puts "\n"
=======
    @user_cruiser = Ship.new("Cruiser", 3) 
  end


  def random_coordinate_generator(ship)
    cells = []
    until @computer.valid_placement?(ship, cells)
      cells = []
      ship.length.times do
        cells << @computer.cells.keys.sample
      end
    end
    cells
  end

  def computer_coordinates
    random_coordinate_generator(@computer_cruiser)
    @computer.place(@computer_cruiser, random_coordinate_generator(@computer_cruiser))
    random_coordinate_generator(@computer_submarine)
    @computer.place(@computer_submarine, random_coordinate_generator(@computer_submarine))
  end

  # def place_computer_ship(ship)
  #   @computer.place(ship, random_coordinate_generator(ship))
  # end

  def player_coordinates
    puts "I have laid out my ships on the grid."
    puts "You now need to lay out your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long."
>>>>>>> a2cd41a8e166f86e16635a8bc1b9f4cffa62ef3c
    puts "  1 2 3 4"
    puts "A . . . ."
    puts "B . . . ."
    puts "C . . . ."
    puts "D . . . ."
<<<<<<< HEAD
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
    @player.place(@user_cruiser, cell)
    puts "\n"
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
    puts "\n"
    @player.render(true)
    puts "\n"
  end

  def player_shot
    puts "Enter the coordinate for your shot:"
    print ">"
    shot = gets.chomp.upcase.to_s
    until (@computer.valid_coordinate?(shot) == true) && (@computer.cells[shot].fired_upon? == false)
=======
    puts "Enter the squares for the Cruiser (3 spaces):"
    print ">"
#asking for cuiser placement
    cell = gets.chomp.upcase.split
    until @player.valid_placement?(@user_cruiser, cell)
      puts "Those coordinates aren't valid - please try again"
      print ">"
      cell = gets.chomp.upcase.split
    end
    @player.place(@user_cruiser, cell)
    @player.render(true)

    puts "Enter the squares for the Submarine (2 spaces):"
    print ">"
    #asking for sub placement
    cell2 = gets.chomp.upcase.split
    until @player.valid_placement?(@user_submarine, cell2)
      puts "Those coordinates aren't valid - please try again"
      print ">"
      cell2 = gets.chomp.upcase.split
    end
    @player.place(@user_submarine, cell2)
    @player.render(true)
  end

  def player_shot
    puts "Enter the coordiante for you shot:"
    print ">"
    shot = gets.chomp.upcase.to_s
    until (@computer.valid_coordinate?(shot) && !(@computer.cells[shot].fired_upon?))
>>>>>>> a2cd41a8e166f86e16635a8bc1b9f4cffa62ef3c
      puts "Please enter a valid coordinate:"
      print ">"
      shot = gets.chomp.upcase
    end
<<<<<<< HEAD
    @computer.cells[shot].fire_upon

    if @computer.cells[shot].empty? == true
      puts "\nYour shot on #{shot} was a miss."
    elsif @computer.cells[shot].empty? == false && @computer.cells[shot].ship.sunk? == true
      puts "\nYour shot on #{shot} was a hit. You have sunk one of the computer's ships!"
    elsif @computer.cells[shot].empty? == false
      puts "\nYour shot on #{shot} was a hit."
    end
=======
      @computer.cells[shot].fire_upon

      if @computer.cells[shot].empty?
        puts "Your shot on #{shot} was a miss."
      elsif !(@computer.cells[shot].empty?) && @computer.cells[shot].ship.sunk?
        puts "Your shot on #{shot} was a hit. You have sunk the computer's ship!"
      elsif !(@computer.cells[shot].empty?)
        puts "Your shot on #{shot} was a hit."
      end
>>>>>>> a2cd41a8e166f86e16635a8bc1b9f4cffa62ef3c
  end

  def computer_shot
    array = []
<<<<<<< HEAD
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
=======
    until @player.valid_coordinate?(array) && !(@player.cells[array].fired_upon?)
      array = @player.cells.keys.sample
    end
    @player.cells[array].fire_upon

    if @player.cells[array].empty?
      puts "The computer's shot on #{array} was a miss."
    elsif !(@player.cells[array].empty?) && @player.cells[array].ship.sunk?
      puts "The computer's shot on #{array} was a hit. The computer have sunk a ship!"
    elsif !(@player.cells[array].empty?)
      puts "The computer's shot on #{array} was a hit."
>>>>>>> a2cd41a8e166f86e16635a8bc1b9f4cffa62ef3c
    end
  end

  def turn
<<<<<<< HEAD
    puts "\n===Computer Board==="
    puts @computer.render
    puts "====Player Board===="
    puts @player.render(true)
=======
    puts "======COMPUTER BOARD======"
    puts @computer.render
    puts "======Player BOARD======"
    puts @player.render(true)
    puts "\n"
>>>>>>> a2cd41a8e166f86e16635a8bc1b9f4cffa62ef3c

    player_shot
    computer_shot
    puts "\n"
  end

  def computer_lose
<<<<<<< HEAD
    return true if (@computer_cruiser.sunk? == true && @computer_submarine.sunk? == true)
=======
    return true if @computer_cruiser.sunk? && @computer_submarine.sunk?
>>>>>>> a2cd41a8e166f86e16635a8bc1b9f4cffa62ef3c
    false
  end

  def player_lose
<<<<<<< HEAD
    return true if (@user_cruiser.sunk? == true && @user_submarine.sunk? == true)
=======
    return true if @user_cruiser.sunk? && @user_submarine.sunk?
>>>>>>> a2cd41a8e166f86e16635a8bc1b9f4cffa62ef3c
    false
  end

  def winner
    until computer_lose == true || player_lose == true
      turn
    end
    if computer_lose == true
<<<<<<< HEAD
      puts "===Computer Board==="
      puts @computer.render
      puts "====Player Board===="
      puts @player.render(true)
      puts "You won!"
    else player_lose == true
      puts "===Computer Board==="
      puts @computer.render
      puts "====Player Board===="
      puts @player.render(true)
=======
      puts "======COMPUTER BOARD======"
      puts @computer.render
      puts "======Player BOARD======"
      puts @player.render(true)
      puts "\n"
      puts "You won!"
    else player_lose == true
      puts "======COMPUTER BOARD======"
      puts @computer.render
      puts "======Player BOARD======"
      puts @player.render(true)
      puts "\n"
>>>>>>> a2cd41a8e166f86e16635a8bc1b9f4cffa62ef3c
      puts "You lost!"
    end
  end

  def main_menu
<<<<<<< HEAD
    puts "Welcome to BATTELSHIP \nEnter p to play. Enter q to quit."
    print ">"
    answer = gets.chomp.upcase.downcase
    if answer == 'p'
=======
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."
    answer = gets.chomp.downcase
    if answer == "p"
>>>>>>> a2cd41a8e166f86e16635a8bc1b9f4cffa62ef3c
      player_coordinates
    else
      "Goodbye."
    end
  end

<<<<<<< HEAD
=======

>>>>>>> a2cd41a8e166f86e16635a8bc1b9f4cffa62ef3c
end
