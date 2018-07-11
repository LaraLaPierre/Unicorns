require_relative "./player"
require_relative "./computer"

 
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

  def add_marker(cell, marker)
    @board[cell] = marker   
  end

  def within_valid_cell?(cell)
    if (0..8).include?(cell) 
        return true
    else
      puts "\nOops! That cell number does not exist, try again!\n\n".colorize(:red)
      sleep 1
      return false
    end
  end

  def cell_available?(cell)
    if @board[cell].class != Symbol 
      return true
    else
      puts "\nOops! There is already a marker there, try again!\n\n".colorize(:red)
      sleep 1
      return false
    end
  end

  def winning_combination?
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
    @board.select{|cell| cell.class == Symbol }.length == 9
  end
end 
