require_relative "./player"
require_relative "./computer"

 
class Board
#Board class is responsible for aspects of the Board only 
  attr_accessor :board
  def initialize
    @board = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
  end 

  def render
    #renders the board
    puts "#{@board[0]} | #{@board[1]} | #{@board[2]}".center(50).colorize(:color => :black, :background => :white)              
    puts "===+===+===".center(50).colorize(:color => :black, :background => :white)                             
    puts "#{@board[3]} | #{@board[4]} | #{@board[5]}".center(50).colorize(:color => :black, :background => :white)                           
    puts "===+===+===".center(50).colorize(:color => :black, :background => :white)                             
    puts "#{@board[6]} | #{@board[7]} | #{@board[8]}".center(50).colorize(:color => :black, :background => :white)
  end 

  def add_marker(cell, marker)
    # place marker on board
    @board[cell] = marker   
  end

  def within_valid_cell?(cell)
    #check if input is a valid cell
    if (0..8).include?(cell.to_i) 
        return true
    else
      # display an error message
      puts
      puts "Oops! That cell number does not exist, try again!".colorize(:red)
      sleep 3
      return false
    end
  end

  def cell_available?(cell)
    # check if cell already has a marker
    if @board[cell].class != Symbol 
      return true
    else
      # display error message
      puts
      puts "Oops! There is already a marker there, try again!".colorize(:red)
      sleep 3
      return false
    end
  end

  def winning_combination?
    # is there a winning combo horizontal, vertical or diagonal?
    [board[0], board[1], board[2]].uniq.length == 1 ||
    [board[3], board[4], board[5]].uniq.length == 1 ||
    [board[6], board[7], board[8]].uniq.length == 1 ||
    [board[0], board[3], board[6]].uniq.length == 1 ||
    [board[1], board[4], board[7]].uniq.length == 1 ||
    [board[2], board[5], board[8]].uniq.length == 1 ||
    [board[0], board[4], board[8]].uniq.length == 1 ||
    [board[2], board[4], board[6]].uniq.length == 1
  end

  def full?
    # does every cell contain a marker, but no winner?
    @board.select{|cell| cell.class == Symbol }.length == 9
  end

end 
