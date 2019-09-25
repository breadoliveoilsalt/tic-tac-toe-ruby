class ThreeByThreeTTTRules

  def box_is_empty?(board, box_number)
    board.data[box_number - 1] == " "
  end
  
  def valid_marker?(player_marker_selection)
    ["X", "x", "O", "o"].each do |acceptable_marker|
      return true if player_marker_selection == acceptable_marker
    end
    false
  end
   
  def valid_move?(board, user_selection)
    data_location = user_selection.to_i - 1
    if board.data[data_location] == " "
      return true
    end
    false
  end

end
