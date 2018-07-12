valid_input = false
      until valid_input == true 
        print "Please choose a marker symbol for Optimus Prime. ".colorize(:white)
        optimus_marker_symbol = gets.chomp
          if optimus_marker_symbol.length == 1
            if optimus_marker_symbol.include? " " 
              puts "\nOops! Your marker symbol cannot contain any spaces. Try again! \n".colorize(:red)
              sleep 3 
              system "clear"
            else 
              valid_input = true
              puts "\nGreat Choice!".colorize(:white)
              marker_choices << optimus_marker_symbol
              sleep 3
            end
          else
            puts "\nOops! A marker symbol must be a single character. Please choose again. \n".colorize(:red)
            sleep 3 
            system "clear"
          end
      end

def valid_marker_input(player_name, marker_symbol)
chosen_markers = []
if @game_play == "0"
  valid_input = false
    until valid_input == true 
    print "\n\nPlease choose a marker symbol for #{player_name}. ".colorize(:white)
    marker_symbol = gets.chomp
      if marker_symbol.length == 1
        if !marker_symbol.include? " "
          if !chosen_markers.include?(marker_symbol)
            puts "\nExcellent Choice!".colorize(:white)
            chosen_markers << marker_symbol
            valid_input = true
            sleep 1
          else
            puts "\nOops! That marker has already been chosen! Please choose again.\n".colorize(:red)
            sleep 1
            # system "clear"
          end
        else
          puts "\nOops! A marker symbol cannot contain any spaces. Try again! \n".colorize(:red)
          sleep 1
          # system "clear"
        end
      else
        puts "\nOops! A marker symbol must be a single character. Please choose again. \n".colorize(:red)
        sleep 1
        # system "clear"
      end
    end
    return marker_symbol
  end
  if @game_play == "1"
  valid_input = false
    until valid_input == true 
      print "\n\n\n#{player_1_name}, enter your desired marker symbol.  ".colorize(:white)
      player_1_marker_symbol = gets.chomp
        if player_1_marker_symbol.length == 1
          if player_1_marker_symbol.include? " " 
            puts "\nOops! A marker symbol cannot contain any spaces. Try again! \n".colorize(:red)
            sleep 2 
            system "clear"
          else 
            valid_input = true
            puts "\nGreat Choice!".colorize(:white)
          end
        else
          puts "\nOops! A marker symbol must be a single character. Please choose again. \n".colorize(:red)
          sleep 2
          system "clear"
        end
    end
  end





end