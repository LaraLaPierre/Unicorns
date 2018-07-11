class Computer 
attr_accessor :name, :marker
 
  def initialize(name = "Computer", marker)
    raise "Marker must be a Symbol!" unless marker.is_a?(Symbol)
    @name = name
    @marker = marker 
  end

  def computer_war_games_choice(board, opponents_marker)
    available_spaces = []
    board.each do |cell|
      if cell.class == String
        available_spaces << cell 
      end 
    end 
    cell = available_spaces.sample.to_i
  end 

  def computer_cell_choice(board, opponents_marker, computers_marker) 
    cell = nil
    cell = center_space(board) 
    if cell != nil
      return cell 
    end 
    cell = winning_move(board, computers_marker)
    if cell != nil
      return cell 
    end 
    cell = block_move(board, opponents_marker)
    if cell != nil
      return cell 
    end
    cell = corner_space(board)
    if cell != nil
      return cell 
    end
    cell = last_space(board)
    if cell != nil
      return cell 
    end    
  end 

  def center_space(board)
    cell = nil 
      if board[4] == "4"
        cell = 4 
      end
  end

  def block_move(board, opponents_marker)
    cell = nil
    if board[0] == opponents_marker && board[1] == opponents_marker && board[2].class != Symbol
      cell = 2
    elsif board[0] == opponents_marker && board[2] == opponents_marker && board[1].class != Symbol
      cell = 1
    elsif board[1] == opponents_marker && board[2] == opponents_marker && board[0].class != Symbol
      cell = 0
    elsif board[3] == opponents_marker && board[4] == opponents_marker && board[5].class != Symbol
      cell = 5
    elsif board[4] == opponents_marker && board[5] == opponents_marker && board[3].class != Symbol
      cell = 3
    elsif board[5] == opponents_marker && board[3] == opponents_marker && board[4].class != Symbol
      cell = 4
    elsif board[6] == opponents_marker && board[7] == opponents_marker && board[8].class != Symbol
      cell = 8
    elsif board[6] == opponents_marker && board[8] == opponents_marker && board[7].class != Symbol
      cell = 7
    elsif board[7] == opponents_marker && board[8] == opponents_marker && board[6].class != Symbol
      cell = 6
    elsif board[0] == opponents_marker && board[6] == opponents_marker && board[3].class != Symbol
      cell = 3
    elsif board[0] == opponents_marker && board[3] == opponents_marker && board[6].class != Symbol
      cell = 6
    elsif board[3] == opponents_marker && board[6] == opponents_marker && board[0].class != Symbol
      cell = 0
    elsif board[1] == opponents_marker && board[4] == opponents_marker && board[7].class != Symbol
      cell =7
    elsif board[4] == opponents_marker && board[7] == opponents_marker && board[1].class != Symbol
      cell = 1
    elsif board[1] == opponents_marker && board[7] == opponents_marker && board[4].class != Symbol
      cell = 4
    elsif board[2] == opponents_marker && board[5] == opponents_marker && board[8].class != Symbol
      cell = 8
    elsif board[2] == opponents_marker && board[8] == opponents_marker && board[5].class != Symbol
      cell = 5
    elsif board[5] == opponents_marker && board[8] == opponents_marker && board[2].class != Symbol
      cell = 2
    elsif board[0] == opponents_marker && board[4] == opponents_marker && board[8].class != Symbol
      cell = 8
    elsif board[0] == opponents_marker && board[8] == opponents_marker && board[4].class != Symbol
      cell = 4
    elsif board[8] == opponents_marker && board[4] == opponents_marker && board[0].class != Symbol
      cell = 0
    end 
  end 

  def corner_space(board)
    cell = nil 
      if board[0] == "0"
        cell = 0
      elsif board[2] == "2"
        cell = 2
      elsif board[6] == "6"
        cell = 6 
      elsif board[8] == "8"
        cell = 8
      end  
  end 

  def winning_move(board, computers_marker)
    cell = nil 
    if board[0] == computers_marker && board[1] == computers_marker && board[2].class != Symbol
      cell = 2
    elsif board[0] == computers_marker && board[2] == computers_marker && board[1].class != Symbol
      cell = 1
    elsif board[1] == computers_marker && board[2] == computers_marker && board[0].class != Symbol
      cell = 0
    elsif board[3] == computers_marker && board[4] == computers_marker && board[5].class != Symbol
      cell = 5
    elsif board[4] == computers_marker && board[5] == computers_marker && board[3].class != Symbol
      cell = 3
    elsif board[5] == computers_marker && board[3] == computers_marker && board[4].class != Symbol
      cell = 4
    elsif board[6] == computers_marker && board[7] == computers_marker && board[8].class != Symbol
      cell = 8
    elsif board[6] == computers_marker && board[8] == computers_marker && board[7].class != Symbol
      cell = 7
    elsif board[7] == computers_marker && board[8] == computers_marker && board[6].class != Symbol
      cell = 6
    elsif board[0] == computers_marker && board[6] == computers_marker && board[3].class != Symbol
      cell = 3
    elsif board[0] == computers_marker && board[3] == computers_marker && board[6].class != Symbol
      cell = 6
    elsif board[3] == computers_marker && board[6] == computers_marker && board[0].class != Symbol
      cell = 0
    elsif board[1] == computers_marker && board[4] == computers_marker && board[7].class != Symbol
      cell =7
    elsif board[4] == computers_marker && board[7] == computers_marker && board[1].class != Symbol
      cell = 1
    elsif board[1] == computers_marker && board[7] == computers_marker && board[4].class != Symbol
      cell = 4
    elsif board[2] == computers_marker && board[5] == computers_marker && board[8].class != Symbol
      cell = 8
    elsif board[2] == computers_marker && board[8] == computers_marker && board[5].class != Symbol
      cell = 5
    elsif board[5] == computers_marker && board[8] == computers_marker && board[2].class != Symbol
      cell = 2
    elsif board[0] == computers_marker && board[4] == computers_marker && board[8].class != Symbol
      cell = 8
    elsif board[0] == computers_marker && board[8] == computers_marker && board[4].class != Symbol
      cell = 4
    elsif board[8] == computers_marker && board[4] == computers_marker && board[0].class != Symbol
      cell = 0
    end
  end  
end 