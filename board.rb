require_relative "./player"
require_relative "./computer"

 
class Board 
  attr_accessor :board
  def initialize
    @board = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
  end 

  def render
    puts "                #{@board[0]} | #{@board[1]} | #{@board[2]} \n               ===+===+===\n                #{@board[3]} | #{@board[4]} | #{@board[5]} \n               ===+===+===\n                #{@board[6]} | #{@board[7]} | #{@board[8]} \n"
  end 

  def add_marker(cell, marker)
        # IF marker_location_valid?
        if within_valid_cell?(cell) && cell_available?(cell)
            # place marker
            @board[cell] = marker
        end
  end

  def within_valid_cell?(cell)
        if (0..8).include?(cell) 
            return true
        else
            # display an error message
            return false
            puts "Cell number is out of bounds"
            
        end
  end

  # coordinates_available?
  def cell_available?(cell)
      # UNLESS marker cell is not occupied
      if @board[cell].class != Integer 
          return true
      else
          # display error message
          puts "There is already a marker there!"
        return false
      end
  end

  # winning_combination?
  def winning_combination?()
      # is there a winning_diagonal?
      # or winning_vertical? 
      # or winning_horizontal? for that piece?
      # winning_diagonal?(piece)   || 
      # winning_horizontal?(piece) || 
      # winning_vertical?(piece)
      # board = @board
      [board[0], board[1], board[2]].uniq.length == 1 ||
      [board[3], board[4], board[5]].uniq.length == 1 ||
      [board[6], board[7], board[8]].uniq.length == 1 ||
      [board[0], board[3], board[6]].uniq.length == 1 ||
      [board[1], board[4], board[7]].uniq.length == 1 ||
      [board[2], board[5], board[8]].uniq.length == 1 ||
      [board[0], board[4], board[8]].uniq.length == 1 ||
      [board[2], board[4], board[6]].uniq.length == 1
  end

  # full?
  def full?
      # does every cell contain a marker?
      # @board.each do |cell|
      #     cell.none?(&:nil?)
      # end
      @board.select{|cell| cell.class == Symbol }.length == 9
      # b.all? { |s| s == "X" || s == "O" }
  end

end 
