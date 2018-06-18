require_relative "./board"
require_relative "./player"
require_relative "./computer"
require "colorize"

 
class Game
  def initialize
    system "clear"

    puts "=".colorize(:white) * 60
    puts "              WELCOME TO LARA'S TIC TAC TOE GAME!           ".colorize(:color => :light_blue, :background => :white)
    puts "=".colorize(:white) * 60
    puts 
    puts

    game_setup
     
  end

  def game_setup
    puts "Please choose the number of players:\n \n (0) Computer vs. Computer\n (1) Human vs. Computer\n (2) Human vs. Human".colorize(:white)
    puts
    @game_play = gets.chomp
    puts

    if @game_play == "1"
      system "clear"
      @computer = Computer.new("Robot", :X)
      puts "You've chosen to play against #{@computer.name}, the Computer!\n".colorize(:white)
      print "Player 1, please enter your name.  ".colorize(:white)
      player_1_name = gets.chomp
      puts
      puts "#{@computer.name}'s marker symbol is #{@computer.marker}.".colorize(:white)
      sleep 1
      puts
      print "#{player_1_name}, enter your desired marker symbol.  ".colorize(:white)
      player_1_marker_symbol = gets.chomp
    
      @player_1 = Player.new(player_1_name, player_1_marker_symbol.to_sym)
      @board = Board.new
      @game_over = false
      @current_player = @player_1
      system "clear"

      puts
      puts "#{player_1_name} (#{player_1_marker_symbol}), you will go first.  ".colorize(:white)
      puts
      puts "    ******  Let the game begin!  *****\n\n" .center(50).colorize(:blue)
      # first_player = @current_player
      # second_player = @computer

    elsif @game_play == "2"
      puts "You've chosen to a two player game!"
      puts
      print "Please enter Player 1 name.  "
      player_1_name = gets.chomp
      puts
      print "Please enter Player 2 name.  "
      player_2_name = gets.chomp
      puts
      print "#{player_1_name}, enter your desired marker symbol.  "
      player_1_marker_symbol = gets.chomp
      puts
      print "#{player_2_name}, enter your desired marker symbol.  "
      player_2_marker_symbol = gets.chomp
      @player_1 = Player.new(player_1_name, player_1_marker_symbol.to_sym)
      @player_2 = Player.new(player_2_name, player_2_marker_symbol.to_sym)

      puts
      puts "Who would like to go first?  "
      puts "Select 1 for #{@player_1.name}"
      puts "Select 2 for #{@player_2.name}"

      first_player = gets.chomp.to_i

      if first_player == 1
        @current_player = @player_1
      elsif 
        first_player == 2
        @current_player = @player_2
      end 
    end 
  end 


  def start_game 
  #loop until there is a winner, or a tie
  @board = Board.new
  until @game_over

    #display the game board 
    @board.render
    sleep 1
    good_cell_choice = false

    until good_cell_choice
    # ask for cell choice from the current player
      if @current_player != @computer
        cell = @current_player.get_cell_choice 
      else
        cell = @computer.computer_cell_choice(@board.board, @player_1.marker) 
      end
      #validate cell choice
      if @board.within_valid_cell?(cell) && @board.cell_available?(cell)
         good_cell_choice = true
      end 
    end
      puts 
      puts 
      @board.add_marker(cell, @current_player.marker)
      puts "=".colorize(:white) * 50 
      puts "U P D A T E D  B O A R D".center(50).colorize(:green)
      puts "#{@current_player.name} chose ##{cell}".center(50).colorize(:blue)
      puts "=".colorize(:white) * 50 
      puts
      puts
      #display updated board with latest move
      @board.render
      puts 
      puts 
      #check if there is a win or a tie
      if check_game_over
        break
      end 

      puts
      puts "Press ENTER to continue".center(50).colorize(:green)
      gets
      system "clear"
      switch_players
      puts 
      puts "=".colorize(:white) * 50
      puts "#{@current_player.name}, your turn!".center(50).colorize(:blue)
      puts "=".colorize(:white) * 50
      puts
    end
  end


  def check_game_over
   # check if the game is over, and if so, want to play again
    if check_victory(@board) || check_draw(@board)
      puts
      play_again
    end 
  end

  def check_victory(board)
    # IF Board says current player's marker has a winning combination
    if @board.winning_combination? == true
      # then output a victory message
      puts "=".colorize(:white) * 50 
      puts "Congratulations #{@current_player.name}, you win!".center(50).colorize(:color => :light_blue, :background => :white).blink
      puts "G A M E  O V E R".center(50).colorize(:color => :light_blue, :background => :white)
      puts "=".colorize(:white) * 50 
      @game_over = true
    else
      false
    end
  end

  def check_draw(board)
    # If board is full of markers
    if @board.full?
      # display draw message
      puts "=".colorize(:white) * 50 
      puts "Game ends with a tie!".center(50).colorize(:color => :light_blue, :background => :white).blink
      puts "G A M E  O V E R".center(50).colorize(:color => :light_blue, :background => :white)
      puts "=".colorize(:white) * 50 
      @game_over = true
      true
    else
        false
    end
  end

  def switch_players
    if @game_play.to_i == 2
      if @current_player == @player_1
        @current_player = @player_2
      else
        @current_player = @player_1
      end
    elsif @game_play.to_i == 1
      if @current_player == @player_1
        @current_player = @computer
      else
        @current_player = @player_1
      end
      
    end 
  end

  def play_again
    if @game_play.to_i == 1
      print "Would you like to play Robot again?  Y/N:   ".center(50).colorize(:red)
      response = gets.chomp
    elsif @game_play.to_i == 2
      print "#{@player_1.name} & #{@player_2.name}, would you like to play again?  Y/N:   ".center(50).colorize(:red)
      response = gets.chomp
    end 
    if response.downcase == "y"
      system "clear"
      puts "testing yes" 
      @game_over = false
      puts "=".colorize(:white) * 50 
      puts "N E W  G A M E".center(50).colorize(:blue)
      puts "=".colorize(:white) * 50 
      puts
      start_game
    elsif response.downcase == "n"
      puts "testing no"
      @game_over = true
      system "clear"
      puts "=".colorize(:white) * 50 
      puts "=".colorize(:white) * 50 
      puts " ".colorize(:white) * 50 
      puts " ".colorize(:white) * 50
      puts "Thanks for playing!\n".center(50).colorize(:blue)
      puts "See you next time for another rousing game of".center(50).colorize(:color => :light_blue, :background => :white)
      puts "TIC TAC TOE!".center(50).colorize(:color => :light_blue, :background => :white)
      puts " ".colorize(:white) * 50 
      puts " ".colorize(:white) * 50
      puts "=".colorize(:white) * 50 
      puts "=".colorize(:white) * 50 
      exit
    end
  end 

end

game = Game.new
game.start_game
