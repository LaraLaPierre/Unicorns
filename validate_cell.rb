require_relative "./player"
require_relative "./board"

require "colorize"

class ValidateCell

  def within_valid_cell?(cell)
      if (0..8).include?(cell) 
        return true
      else
        return false
      end
  end

  def cell_available?(current_board, cell) 
    if current_board[cell].class != Symbol 
      return true
    else
      return false
    end
  end

  def is_numeric?(cell)
    !!Float(cell) rescue false
  end
end


# ------------------ Unit Tests --------------------

validate_cell = ValidateCell.new


puts "Testing #within_valid_cell?  for return of true"
if validate_cell.within_valid_cell?(3) == true
  puts "Test Passes"
else 
  puts "Test Fails".colorize(:red)
end 

puts "Testing #within_valid_cell? for return of false"
if validate_cell.within_valid_cell?(11) == false
  puts "Test Passes"
else 
  puts "Test Fails".colorize(:red)
end

puts "Testing #is_numeric? for return of true"
if validate_cell.is_numeric?("2") == true
  puts "Test Passes"
else 
  puts "Test Fails".colorize(:red)
end

puts "Testing #is_numeric? for return of false"
if validate_cell.is_numeric?("e") == false
  puts "Test Passes"
else 
  puts "Test Fails".colorize(:red)
end


# puts "Testing #cell_available for return of true"
# @board = Board.new
# validate_cell = ValidateCell.new

# if validate_cell.cell_available?(@board.board, 3) == true
#   puts "Test Passes"
# else 
#   puts "Test Fails"
# end 

# puts "Testing #cell_available for return of false"
# validate_cell = ValidateCell.new
# @board = Board.new
# @board[3] == :X
# if validate_cell.cell_available?(@board.board, 3) == false
#   puts "Test Passes"
# else 
#   puts "Test Fails"
# end 
