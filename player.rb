require_relative "./computer"
require_relative "./board"
require_relative "./validate_cell"


 
class Player
 attr_accessor :name, :marker

  def initialize(name = "Player_1", marker)
    raise "Marker must be a Symbol!" unless marker.is_a?(Symbol)
    @name = name
    @marker = marker
  end

  def get_cell_choice  
    cell = gets.chomp
  end
end 