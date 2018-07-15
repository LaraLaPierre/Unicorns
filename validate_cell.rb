class ValidateCell

  def within_valid_cell?(current_board, cell)
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