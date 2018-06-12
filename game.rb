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

    puts "Please choose the number of players:\n \n (0) Computer vs. Computer\n (1) Human vs. Computer\n (2) Human vs. Human".colorize(:white)
    puts
    game_play = gets.chomp
    puts

    if game_play == "1"
      system "clear"
      @computer = Computer.new("Robot", :X)
      puts "You've chosen to play against #{@computer.name}, the Computer!\n".colorize(:white)
      print "Player 1, please enter your name.  ".colorize(:white)
      player_1_name = gets.chomp
      puts
      print "#{player_1_name}, enter your desired marker symbol.  ".colorize(:white)
      puts "#{@computer.name}'s marker symbol is #{@computer.marker}.".colorize(:white)
      player_1_marker_symbol = gets.chomp
   
      @player_1 = Player.new(player_1_name, player_1_marker_symbol.to_sym)
      @board = Board.new
      @game_over = false
      @current_player = @player_1
      system "clear"

      puts
      puts "#{player_1_name} (#{player_1_marker_symbol}), you will go first.  ".colorize(:white)
      puts
      puts "          ******  Let the game begin!  *****\n\n" .colorize(:white)
      # first_player = @current_player
      # second_player = @computer

    elsif game_play == "2"
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
      puts
      print "Who would like to go first?  "
      first_player = gets.chomp
      if first_player == player_1_name
        second_player = player_2_name
      elsif 
        first_player == player_2_name
        second_player == player_1_name
      end 
    end  
     
  end

  def game_setup


  end 


  def start_game 
      until @game_over

          # call the board rendering method
          @board.render
          sleep 2

          # ask for cell choice from the current player
            if @current_player != @computer
              cell = @current_player.get_cell_choice 
            else
              cell = @computer.computer_cell_choice(@board.board, @player_1.marker)
            end
          puts 
          puts 
          @board.add_marker(cell, @current_player.marker)
          puts "=".colorize(:white) * 60 
          puts "                      UPDATED BOARD".colorize(:red)
          puts "=".colorize(:white) * 60 
          @board.render
          puts 
          puts 
          # system "clear"
          # puts "============"
          # puts @computer.name

          if check_game_over
            break
          end 
          # check if game is over
          # switch players 
          puts
          puts "Press ENTER to continue".colorize(:white)
          gets
          system "clear"
          switch_players
          puts 
          puts "=".colorize(:white) * 60
          puts "#{@current_player.name}, your turn \n"
          puts "=".colorize(:white) * 60
          puts

      end
  end


  # check_game_over?
  def check_game_over
    check_victory(@board) || check_draw(@board)
  end

  # check_victory?
  def check_victory(board)
      # IF Board says current player's marker has
      # a winning_combination?
      if @board.winning_combination? == true
          # then output a victory message
          puts "Congratulations #{@current_player.name}, you win!"
          @game_over = true
          true
      else
          false
      end
  end

  # check_draw?
  def check_draw(board)
      # If Board says we've filled up 
      if @board.full?
          # display draw message
          puts "Game ends with a tie!"
          @game_over = true
          true
      else
          false
      end
  end

  # switch_players
  def switch_players
      if @current_player == @player_1
          @current_player = @computer
      else
          @current_player = @player_1
      end
  end

end

game = Game.new
game.start_game
