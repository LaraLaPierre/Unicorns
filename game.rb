require_relative "./board"
require_relative "./player"
require_relative "./computer"


class Game
  def initialize
    puts "=" * 50
    puts "        WELCOME TO LARA'S TIC TAC TOE GAME!"
    puts "=" * 50
    puts 
    puts

    puts "Please choose the number of players: Computer vs. Computer(0), Human vs. Computer(1), or Human vs. Human(2)"
    puts
    game_play = gets.chomp
    puts

    if game_play == "1"
      puts "You've chosen to play against the Computer!"
      puts
      print "Please enter Player 1 name.  "
      player_1_name = gets.chomp
      puts
      print "#{player_1_name}, enter your desired marker symbol.  "
      player_1_marker_symbol = gets.chomp
   
      @player_1 = Player.new(player_1_name, player_1_marker_symbol.to_sym)

      @computer = Computer.new("Robot", :O)
      @board = Board.new
      @game_over = false
      @current_player = @player_1

      puts
      puts "#{player_1_name}, you will go first.  "
      puts
      puts "          ******Let the game begin!*****"
      # first_player = @current_player
      second_player = @computer

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
      # loop infinitely
      # loop do
      until @game_over
          # call the board rendering method
          @board.render
          # ask for cell choice from the current player
            if @current_player != @computer
              cell = @current_player.get_cell_choice 
            else
              puts @player_1.marker 
              puts "====================="
              cell = @computer.computer_cell_choice(@board.board, @player_1.marker)
            end

          @board.add_marker(cell, @current_player.marker)
          puts 
          puts 

          @board.render
          # check if game is over
          system "clear"
          # switch players
          switch_players

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
