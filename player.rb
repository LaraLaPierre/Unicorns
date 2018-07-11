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
    print "\n\n#{@name}(#{@marker}), choose a cell number between 0 and 8:  \n".colorize(:white)
    cell = gets.chomp.to_i
  end
end 