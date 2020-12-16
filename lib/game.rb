class Game
  attr_reader :player
              :computer
              :computer_submarine
              :user_submarine
              :computer_cruiser
              :user_cruiser

  def initialize
    @player             = Board.new
    @computer           = Board.new
    @computer_submarine = Ship.new("Submarine", 2)
    @user_submarine     = Ship.new("Submarine", 2)
    @computer_cruiser   = Ship.new("Cruiser", 3)
    @user_cruiser       = Ship.new("Cruiser", 3)
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


  def lay_player_ships_prompt
    puts "\nI have laid out my ships on the grid."
    puts "You now need to lay out your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long."
    puts "\n"
    puts "  1 2 3 4"
    puts "A . . . ."
    puts "B . . . ."
    puts "C . . . ."
    puts "D . . . ."
  end


  def player_cruiser_placement
    puts "\nEnter the squares for the Cruiser (3 spaces):"
    print ">"
    cells = gets.chomp.upcase.split(" ")
    until @player.valid_placement?(@user_cruiser, cells)
      puts "Those are invalid coordinates. Please try again:"
      print ">"
      cells = gets.chomp.upcase.split
    end
    cells

    @player.place(@user_cruiser, cells)
    puts "\n"
    puts @player.render(true)
  end

  def player_submarine_placement
    puts "\nEnter the squares for the Submarine (2 spaces):"
    print ">"
    cells2 = gets.chomp.upcase.split
    until @player.valid_placement?(@user_submarine, cells2)
      puts "Those are invalid coordinates. Please try again:"
      print ">"
      cells2 = gets.chomp.upcase.split
    end
    cells2

    @player.place(@user_submarine, cells2)
    puts "\n"
    puts "Our board's are now set!"
  end

  def player_coordinates
    lay_player_ships_prompt
    player_cruiser_placement
    player_submarine_placement
  end

  def player_shot
    puts "Enter the coordinate for your shot:"
    print ">"
    shot = gets.chomp.upcase.to_s
    until (@computer.valid_coordinate?(shot) == true) && (@computer.cells[shot].fired_upon? == false)
      puts "Please enter a valid coordinate:"
      print ">"
      shot = gets.chomp.upcase
    end

    @computer.cells[shot].fire_upon

    if @computer.cells[shot].empty? == true
      puts "\nYour shot on #{shot} was a miss."
    elsif @computer.cells[shot].empty? == false && @computer.cells[shot].ship.sunk? == true
      puts "\nYour shot on #{shot} was a hit. You have sunk one of the computer's ships!"
    elsif @computer.cells[shot].empty? == false
      puts "\nYour shot on #{shot} was a hit."
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
      puts "The computer's shot on #{array} was a miss."
    elsif @player.cells[array].empty? == false && @player.cells[array].ship.sunk? == true
      puts "The computer's shot on #{array} was a hit. The computer has sunk one of your ships!\n"
    elsif @player.cells[array].empty? == false
      puts "The computer's shot on #{array} was a hit."
    end
  end

  def turn
    puts "\n===Computer Board==="
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

  def computer_lose_prompt
    puts "===Computer Board==="
    puts @computer.render
    puts "====Player Board===="
    puts @player.render(true)
    puts "\n"
    puts "You won!"
  end

  def player_lose_prompt
    puts "===Computer Board==="
    puts @computer.render
    puts "====Player Board===="
    puts @player.render(true)
    puts "\n"
    puts "You lost!"
  end

  def winner
    until computer_lose == true || player_lose == true
      turn
    end
    if computer_lose == true
      computer_lose_prompt
      puts "\n"
      main_menu
    else player_lose == true
      player_lose_prompt
      puts "\n"
      main_menu
    end
  end

  def main_menu
    puts "Welcome to BATTLESHIP \nEnter P to play. Enter Q to quit."
    print ">"
    answer = gets.chomp.upcase.downcase
    if answer == 'p'
      player_coordinates
    elsif answer == "q"
      abort "\nGoodbye!"
    else
      puts "Not a valid input."
      puts "\n"
      main_menu
    end
  end
end
