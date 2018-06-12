def winning_move(board)
    if 
      board[0] == X && board[1] == X
      cell = 2
    elsif 
      board[0] == X && board[2] == X
      cell = 1
    elsif
      board[1] == X && board[2] == X
      cell = 0
    elsif 
      board[3] == X && board[4] == X
      cell = 5
    elsif 
      board[4] == X && board[5] == X
      cell = 3
    elsif 
      board[5] == X && board[3] == X
      cell = 4
    elsif 
      board[6] == X && board[7] == X
      cell = 8
    elsif 
      board[6] == X && board[8] == X
      cell = 7
    elsif 
      board[7] == X && board[8] == X
      cell = 6
    end