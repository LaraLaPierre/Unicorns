require_relative "./computer"
require_relative "./board"

 
class Player
 attr_accessor :name, :marker

  def initialize(name = "Player_1", marker)
    raise "Marker must be a Symbol!" unless marker.is_a?(Symbol)
    @name = name
    @marker = marker
  end

  def get_cell_choice
    valid_input = false
    until valid_input  
      print "\n\n#{@name}(#{@marker}), choose a cell number between 0 and 8:  \n".colorize(:white)
      cell = gets.chomp
        if is_numeric?(cell) 
          valid_input = true
        else 
          puts "\nOops! The cell choice must be a number. Try again. ".colorize(:red)
        end
    end
    return cell.to_i
  end

  def is_numeric?(cell)
    !!Float(cell) rescue false
  end
end 