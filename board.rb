require_relative "./player"
require_relative "./computer"
require_relative "./validate_cell"


 
class Board
  attr_accessor :board
  def initialize
    @board = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
  end 

  def render
    puts "#{@board[0]} | #{@board[1]} | #{@board[2]}".center(50).colorize(:color => :black, :background => :white)              
    puts "===+===+===".center(50).colorize(:color => :black, :background => :white)                             
    puts "#{@board[3]} | #{@board[4]} | #{@board[5]}".center(50).colorize(:color => :black, :background => :white)                           
    puts "===+===+===".center(50).colorize(:color => :black, :background => :white)                             
    puts "#{@board[6]} | #{@board[7]} | #{@board[8]}".center(50).colorize(:color => :black, :background => :white)
  end 
end 
