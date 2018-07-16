require "colorize"

class ValidateUserSetup

  def valid_name?(user_input, names_chosen)
    if user_input != nil
      if !names_chosen.include?(user_input)
        if user_input.length > 1 && !is_numeric?(user_input)
          if !user_input.include? " "
            valid_input = true
          else 
            valid_input = false
          end 
        else 
          valid_input = false
        end
      else 
        valid_input = false
      end
    else
      valid_input = false
    end     
  end 

  def valid_symbol?(user_input, symbols_chosen)
    if !symbols_chosen.include?(user_input)
      if user_input.length == 1 && !is_numeric?(user_input)
        if !user_input.include? " "
          valid_input = true
        else 
          valid_input = false
        end 
      else 
        valid_input = false
      end
    else
      valid_input = false
    end
  end  

  def is_numeric?(user_input)
    !!Float(user_input) rescue false
  end 

end

# ------------------ Unit Tests --------------------

validate_user_setup = ValidateUserSetup.new

puts "Testing #valid_name? for return of true"
if validate_user_setup.valid_name?("Lara", ["Joe"]) == true
  puts "Test Passes"
else 
  puts "Test Fails".colorize(:red)
end

puts "Testing #valid_name? for return of false"
if validate_user_setup.valid_name?(nil, ["Lara","Joe"]) == false
  puts "Test Passes"
elsif validate_user_setup.valid_name?("Joe", ["Lara","Joe"]) == false
  puts "Test Passes"
elsif validate_user_setup.valid_name?("J", ["Lara","Joe"]) == false
  puts "Test Passes"
elsif validate_user_setup.valid_name?(" ", ["Lara","Joe"]) == false
  puts "Test Passes"
else 
  puts "Test Fails".colorize(:red) 
end

puts "Testing #valid_symbol? for return of true"
if validate_user_setup.valid_symbol?("$", ["#"]) == true
  puts "Test Passes"
else 
  puts "Test Fails".colorize(:red)
end

puts "Testing #valid_symbol? for return of false"
if validate_user_setup.valid_symbol?("$", ["$"]) == false
  puts "Test Passes"
elsif validate_user_setup.valid_symbol?("$$", ["$"]) == false
  puts "Test Passes"
elsif validate_user_setup.valid_symbol?("7", ["$"]) == false
  puts "Test Passes"
elsif validate_user_setup.valid_symbol?(" ", ["$"]) == false
  puts "Test Passes"
else 
  puts "Test Fails".colorize(:red)
end

puts "Testing #is_numeric? for return of true"
if validate_user_setup.is_numeric?(2) == true
  puts "Test Passes"
else 
  puts "Test Fails".colorize(:red)
end

puts "Testing #is_numeric? for return of false"
if validate_user_setup.is_numeric?("e") == false
  puts "Test Passes"
else 
  puts "Test Fails".colorize(:red)
end
