# class Computer < Player 
# attr_accessor :name, :marker
 
#   def initialize(name, marker)
#     raise "Marker must be a Symbol!" unless marker.is_a?(Symbol)
#     @name = name
#     @marker = marker 
#   end

#   def computer_war_games_choice(board, opponents_marker)
#     available_spaces = []
#     board.each do |cell|
#       if cell.class == String
#         available_spaces << cell 
#       end 
#     end 
#     cell = available_spaces.sample.to_i
#   end 

#   def computer_cell_choice(board, opponents_marker, computers_marker, cells_chosen, first_player) 
#     cell = nil
#     if first_player == "1"
#       cell = winning_move(board, computers_marker)
#       if cell != nil
#         return cell 
#       end 
#       cell = block_move(board, opponents_marker)
#       if cell != nil
#         return cell 
#       end
        
#       if cells_chosen.first == 4
#         cell = corner_space(board, opponents_marker, cells_chosen)
#         if cell != nil
#          return cell 
#         end 
#       end 
      
#       if cells_chosen.first != 4
#         cell = center_space(board) 
#         if cell != nil
#           return cell 
#         end 
#         if (cells_chosen[0] == 0 && cells_chosen[2] == 8) || (cells_chosen[0] == 8 && cells_chosen[2] == 0) 
#           cell = edge_space(board, cells_chosen) 
#           if cell != nil
#             return cell 
#           end
#         elsif  
#           (cells_chosen[0] == 2 && cells_chosen[2] == 6) || (cells_chosen[0] == 6 && cells_chosen[2] == 2) 
#           cell = edge_space(board, cells_chosen) 
#           if cell != nil
#             return cell 
#           end
#         end

#         cell = corner_space(board, opponents_marker, cells_chosen)
#         if cell != nil
#          return cell 
#         end
#       end

#       cell = edge_space(board, cells_chosen) 
#       if cell != nil
#         return cell 
#       end 

#     elsif first_player == "2"
#       cell = winning_move(board, computers_marker)
#       if cell != nil
#         return cell 
#       end 
#       cell = block_move(board, opponents_marker)
#       if cell != nil
#         return cell 
#       end
#       cell = center_space(board) 
#       if cell != nil
#         return cell 
#       end 
#       cell = take_furthest_corner(board, cells_chosen)
#       if !cells_chosen.include?(cell) && cell != nil
#         return cell
#       end
#       cell = take_opposite_corner(board, cells_chosen)
#       if !cells_chosen.include?(cell)
#         return cell
#       end
#     end
#   end 

#   def center_space(board)
#     cell = nil 
#       if board[4] == "4"
#         cell = 4 
#       end
#   end

#   def take_furthest_corner(board, cells_chosen)
#     cell = nil
#     if cells_chosen.last == 1 
#       cell = 6  
#     elsif cells_chosen.last == 3
#       cell = 8 
#     elsif cells_chosen.last == 5
#       cell = 0 
#     elsif cells_chosen.last == 7
#       cell = 2  
#     end 
#   end 

#   def take_opposite_corner(board, cells_chosen)
#     cell = nil
#     if cells_chosen.last == 0 
#       cell = 8  
#     elsif cells_chosen.last == 2
#       cell = 6 
#     elsif cells_chosen.last == 6
#       cell = 2 
#     elsif cells_chosen.last == 8
#       cell = 0 
#     end 
#   end 

#   def edge_space(board, cells_chosen)
#     cell = nil
#     if board[1] == "1"
#         cell = 1
#       elsif board[3] == "3"
#         cell = 3
#       elsif board[5] == "5"
#         cell = 5 
#       elsif board[7] == "7"
#         cell = 7
#       end  

#   end 

#   def block_move(board, opponents_marker)
#     cell = nil
#     if board[0] == opponents_marker && board[1] == opponents_marker && board[2].class != Symbol
#       cell = 2
#     elsif board[0] == opponents_marker && board[2] == opponents_marker && board[1].class != Symbol
#       cell = 1
#     elsif board[1] == opponents_marker && board[2] == opponents_marker && board[0].class != Symbol
#       cell = 0
#     elsif board[3] == opponents_marker && board[4] == opponents_marker && board[5].class != Symbol
#       cell = 5
#     elsif board[4] == opponents_marker && board[5] == opponents_marker && board[3].class != Symbol
#       cell = 3
#     elsif board[5] == opponents_marker && board[3] == opponents_marker && board[4].class != Symbol
#       cell = 4
#     elsif board[6] == opponents_marker && board[7] == opponents_marker && board[8].class != Symbol
#       cell = 8
#     elsif board[6] == opponents_marker && board[8] == opponents_marker && board[7].class != Symbol
#       cell = 7
#     elsif board[7] == opponents_marker && board[8] == opponents_marker && board[6].class != Symbol
#       cell = 6
#     elsif board[0] == opponents_marker && board[6] == opponents_marker && board[3].class != Symbol
#       cell = 3
#     elsif board[0] == opponents_marker && board[3] == opponents_marker && board[6].class != Symbol
#       cell = 6
#     elsif board[3] == opponents_marker && board[6] == opponents_marker && board[0].class != Symbol
#       cell = 0
#     elsif board[1] == opponents_marker && board[4] == opponents_marker && board[7].class != Symbol
#       cell =7
#     elsif board[4] == opponents_marker && board[7] == opponents_marker && board[1].class != Symbol
#       cell = 1
#     elsif board[1] == opponents_marker && board[7] == opponents_marker && board[4].class != Symbol
#       cell = 4
#     elsif board[2] == opponents_marker && board[5] == opponents_marker && board[8].class != Symbol
#       cell = 8
#     elsif board[2] == opponents_marker && board[8] == opponents_marker && board[5].class != Symbol
#       cell = 5
#     elsif board[5] == opponents_marker && board[8] == opponents_marker && board[2].class != Symbol
#       cell = 2
#     elsif board[0] == opponents_marker && board[4] == opponents_marker && board[8].class != Symbol
#       cell = 8
#     elsif board[0] == opponents_marker && board[8] == opponents_marker && board[4].class != Symbol
#       cell = 4
#     elsif board[8] == opponents_marker && board[4] == opponents_marker && board[0].class != Symbol
#       cell = 0
#     end 
#   end 

#   def corner_space(board, opponents_marker, cells_chosen)
#     cell = nil 
#       if cells_chosen.first == 4 && board[0] == "0"
#         cell = 0
#       elsif board[1] == opponents_marker && board[3] == opponents_marker && board[0] == "0"
#         cell = 0
#       elsif board[1] == opponents_marker && board[5] == opponents_marker && board[2] == "2"
#         cell = 2
#       elsif board[3] == opponents_marker && board[7] == opponents_marker && board[6] == "6"
#         cell = 6
#       elsif board[5] == opponents_marker && board[7] == opponents_marker && board[8] == "8"
#         cell = 8 
#       elsif board[0] == "0"
#         cell = 0
#       elsif board[2] == "2"
#         cell = 2
#       elsif board[6] == "6"
#         cell = 6
#       elsif board[8] == "8"
#         cell = 8
#       end  
#   end 

#   def winning_move(board, computers_marker)
#     cell = nil 
#     if board[0] == computers_marker && board[1] == computers_marker && board[2].class != Symbol
#       cell = 2
#     elsif board[0] == computers_marker && board[2] == computers_marker && board[1].class != Symbol
#       cell = 1
#     elsif board[1] == computers_marker && board[2] == computers_marker && board[0].class != Symbol
#       cell = 0
#     elsif board[3] == computers_marker && board[4] == computers_marker && board[5].class != Symbol
#       cell = 5
#     elsif board[4] == computers_marker && board[5] == computers_marker && board[3].class != Symbol
#       cell = 3
#     elsif board[5] == computers_marker && board[3] == computers_marker && board[4].class != Symbol
#       cell = 4
#     elsif board[6] == computers_marker && board[7] == computers_marker && board[8].class != Symbol
#       cell = 8
#     elsif board[6] == computers_marker && board[8] == computers_marker && board[7].class != Symbol
#       cell = 7
#     elsif board[7] == computers_marker && board[8] == computers_marker && board[6].class != Symbol
#       cell = 6
#     elsif board[0] == computers_marker && board[6] == computers_marker && board[3].class != Symbol
#       cell = 3
#     elsif board[0] == computers_marker && board[3] == computers_marker && board[6].class != Symbol
#       cell = 6
#     elsif board[3] == computers_marker && board[6] == computers_marker && board[0].class != Symbol
#       cell = 0
#     elsif board[1] == computers_marker && board[4] == computers_marker && board[7].class != Symbol
#       cell =7
#     elsif board[4] == computers_marker && board[7] == computers_marker && board[1].class != Symbol
#       cell = 1
#     elsif board[1] == computers_marker && board[7] == computers_marker && board[4].class != Symbol
#       cell = 4
#     elsif board[2] == computers_marker && board[5] == computers_marker && board[8].class != Symbol
#       cell = 8
#     elsif board[2] == computers_marker && board[8] == computers_marker && board[5].class != Symbol
#       cell = 5
#     elsif board[5] == computers_marker && board[8] == computers_marker && board[2].class != Symbol
#       cell = 2
#     elsif board[0] == computers_marker && board[4] == computers_marker && board[8].class != Symbol
#       cell = 8
#     elsif board[0] == computers_marker && board[8] == computers_marker && board[4].class != Symbol
#       cell = 4
#     elsif board[8] == computers_marker && board[4] == computers_marker && board[0].class != Symbol
#       cell = 0
#     end
#   end  
# end 