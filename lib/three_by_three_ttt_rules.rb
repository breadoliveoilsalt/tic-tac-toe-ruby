class ThreeByThreeTTTRules
  
  def valid_marker?(player_marker_selection)
    ["X", "x", "O", "o"].each do |acceptable_marker|
      return true if player_marker_selection == acceptable_marker
    end
    false
  end
   
  def valid_move?(board, user_selection)
    if valid_move_input?(user_selection)
      return true if box_is_empty?(board, user_selection)
    end
    false
  end

  #private

  def valid_move_input?(user_selection)
    an_integer?(user_selection) && within_range?(user_selection) 
  end

  def get_data_location_corresponding_to(stringified_number)
    stringified_number.to_i - 1
  end

  def an_integer?(str)
    begin
      true if Integer(str)
    rescue
      false
    end
  end

  def within_range?(str)
    int = str.to_i
    int >= 1 && int <= 9
  end

  def box_is_empty?(board, box_number)
    data_location = box_number.to_i - 1
    board.data[data_location] == " "
  end

end
#rules = ThreeByThreeTTTRules.new

#puts rules.check_user_selection_is_an_integer("1")
#puts rules.check_user_selection_is_an_integer("1.25")
#puts rules.check_user_selection_is_an_integer("apples")
