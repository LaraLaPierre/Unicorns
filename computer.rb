class Computer 
attr_accessor :name, :marker

  # initialize
  def initialize(name = "Computer", marker)
    # Set marker type (e.g. X or O)
    raise "Marker must be a Symbol!" unless marker.is_a?(Symbol)
    @name = name
    @marker = "O"
  end

  def computer_cell_choice(board, opponents_marker) 
   cell = nil
      if board[4] == "4"
        cell = 4 
      end
    return cell
  end 

  def eval_board(board)
    center_space_avail
    # elsif 
    #   corner_space_avail
    # else
    #   middle_space_avail

  end 

  def center_space_avail(board)
    cell = nil
      if board[4] == "4"
        cell = 4 
      end
    return cell
  end

  def corner_space_avail(board)

  end 

  def middle_space_avail(board)

  end 

  # def get_best_move(board)
  #   available_spaces = []
  #   best_move = nil
  #   board.each do |cell|
  #     if cell.class != Symbol
  #       available_spaces << cell
  #     end
  #   end
  #   puts "================="
  #   p available_spaces
  #   available_spaces.each do |cells|
  #     board[cells.to_i] = @computer
  #     if game_is_over(board)
  #       best_move = cells.to_i
  #       board[cells.to_i] = as
  #       return best_move
  #     else
  #       board[as.to_i] = @player
  #       if game_is_over(board)
  #         best_move = as.to_i
  #         board[as.to_i] = as
  #         return best_move
  #       else
  #         board[as.to_i] = as
  #       end
  #     end
  #   end
  #   if best_move
  #     return best_move
  #   else
  #     n = rand(0..available_spaces.count)
  #     return available_spaces[n].to_i
  #   end
  # end


end 