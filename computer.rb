class Computer 
attr_accessor :name, :marker
 
  # initialize
  def initialize(name = "Computer", marker)
    # Set marker type (e.g. X or O)
    raise "Marker must be a Symbol!" unless marker.is_a?(Symbol)
    @name = name
    @marker = marker 
  end

  def computer_cell_choice(board, opponents_marker) 
    # center_space_avail(board) || winning_move(board) || corner_space_avail(board) 
    @cell = nil
    @cell = center_space_avail(board) 
    if @cell != nil
      return @cell
    end 
    @cell = winning_move(board)
    if @cell != nil
      return @cell
    end 
    @cell = block_move(board, opponents_marker)
    if @cell != nil
      return @cell
    end
    @cell = corner_space_avail(board)
    if @cell != nil
      return @cell
    end  
  end 

  def center_space_avail(board)
    @cell = nil 
      if board[4] == "4"
        @cell = 4 
      end
    return @cell
  end

  def block_move(board, opponents_marker)
    @cell = nil
    if 
      board[0] == opponents_marker && board[1] == opponents_marker && board[2].class != Symbol
      cell = 2
    elsif 
      board[0] == opponents_marker && board[2] == opponents_marker && board[1].class != Symbol
      cell = 1
    elsif
      board[1] == opponents_marker && board[2] == opponents_marker && board[0].class != Symbol
      cell = 0
    elsif 
      board[3] == opponents_marker && board[4] == opponents_marker && board[5].class != Symbol
      cell = 5
    elsif 
      board[4] == opponents_marker && board[5] == opponents_marker && board[3].class != Symbol
      cell = 3
    elsif 
      board[5] == opponents_marker && board[3] == opponents_marker && board[4].class != Symbol
      cell = 4
    elsif 
      board[6] == opponents_marker && board[7] == opponents_marker && board[8].class != Symbol
      cell = 8
    elsif 
      board[6] == opponents_marker && board[8] == opponents_marker && board[7].class != Symbol
      cell = 7
    elsif 
      board[7] == opponents_marker && board[8] == opponents_marker && board[6].class != Symbol
      cell = 6
    elsif 
      board[0] == opponents_marker && board[6] == opponents_marker && board[3].class != Symbol
      cell = 3
    elsif 
      board[0] == opponents_marker && board[3] == opponents_marker && board[6].class != Symbol
      cell = 6
    elsif 
      board[3] == opponents_marker && board[6] == opponents_marker && board[0].class != Symbol
      cell = 0
    elsif 
      board[1] == opponents_marker && board[4] == opponents_marker && board[7].class != Symbol
      cell =7
    elsif 
      board[4] == opponents_marker && board[7] == opponents_marker && board[1].class != Symbol
      cell = 1
    elsif 
      board[1] == opponents_marker && board[7] == opponents_marker && board[4].class != Symbol
      cell = 4
    elsif 
      board[2] == opponents_marker && board[5] == opponents_marker && board[8].class != Symbol
      cell = 8
    elsif 
      board[2] == opponents_marker && board[8] == opponents_marker && board[5].class != Symbol
      cell = 5
    elsif 
      board[5] == opponents_marker && board[8] == opponents_marker && board[2].class != Symbol
      cell = 2
    elsif 
      board[0] == opponents_marker && board[4] == opponents_marker && board[8].class != Symbol
      cell = 8
    elsif 
      board[0] == opponents_marker && board[8] == opponents_marker && board[4].class != Symbol
      cell = 4
    elsif 
      board[8] == opponents_marker && board[4] == opponents_marker && board[0].class != Symbol
      cell = 0
    end 
    return cell
  end 

  def corner_space_avail(board)
    @cell = nil 
      if board[0] == "0"
        cell = 0
      elsif board[2] == "2"
        cell = 2
      elsif board[6] == "6"
        cell = 6 
      elsif board[8] == "8"
        cell = 8
      end
      return cell 
  end 

  def winning_move(board)
    @cell = nil 
    if 
      board[0] == :X && board[1] == :X && board[2].class != Symbol
      cell = 2
    elsif 
      board[0] == :X && board[2] == :X && board[1].class != Symbol
      cell = 1
    elsif
      board[1] == :X && board[2] == :X && board[0].class != Symbol
      cell = 0
    elsif 
      board[3] == :X && board[4] == :X && board[5].class != Symbol
      cell = 5
    elsif 
      board[4] == :X && board[5] == :X && board[3].class != Symbol
      cell = 3
    elsif 
      board[5] == :X && board[3] == :X && board[4].class != Symbol
      cell = 4
    elsif 
      board[6] == :X && board[7] == :X && board[8].class != Symbol
      cell = 8
    elsif 
      board[6] == :X && board[8] == :X && board[7].class != Symbol
      cell = 7
    elsif 
      board[7] == :X && board[8] == :X && board[6].class != Symbol
      cell = 6
    elsif 
      board[0] == :X && board[6] == :X && board[3].class != Symbol
      cell = 3
    elsif 
      board[0] == :X && board[3] == :X && board[6].class != Symbol
      cell = 6
    elsif 
      board[3] == :X && board[6] == :X && board[0].class != Symbol
      cell = 0
    elsif 
      board[1] == :X && board[4] == :X && board[7].class != Symbol
      cell =7
    elsif 
      board[4] == :X && board[7] == :X && board[1].class != Symbol
      cell = 1
    elsif 
      board[1] == :X && board[7] == :X && board[4].class != Symbol
      cell = 4
    elsif 
      board[2] == :X && board[5] == :X && board[8].class != Symbol
      cell = 8
    elsif 
      board[2] == :X && board[8] == :X && board[5].class != Symbol
      cell = 5
    elsif 
      board[5] == :X && board[8] == :X && board[2].class != Symbol
      cell = 2
    elsif 
      board[0] == :X && board[4] == :X && board[8].class != Symbol
      cell = 8
    elsif 
      board[0] == :X && board[8] == :X && board[4].class != Symbol
      cell = 4
    elsif 
      board[8] == :X && board[4] == :X && board[0].class != Symbol
      cell = 0
    end
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