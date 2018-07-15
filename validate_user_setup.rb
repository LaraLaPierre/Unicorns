class ValidateUserSetup

  def validate_name(user_input, names_chosen)

    if user_input != nil
      if !names_chosen.include?(user_input)
        if user_input.length > 1 && !is_numeric?(user_input)
          if !user_input.include? " "
            valid_input = true
          else 
            valid_input = false
          end 
        end
      end
    else
      valid_input = false
    end     
  end 

  def validate_symbol(user_input, symbols_chosen)
    if !symbols_chosen.include?(user_input)
      if user_input.length == 1 && !is_numeric?(user_input)
        if !user_input.include? " "
          valid_input = true
        else 
          valid_input = false
        end 
      end
    end
  end  

  def is_numeric?(user_input)
    !!Float(user_input) rescue false
  end 

end