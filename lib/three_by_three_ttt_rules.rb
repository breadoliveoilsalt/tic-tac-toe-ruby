class ThreeByThreeTTTRules

  def box_is_empty?(board, box_number)
    board.data[box_number - 1] == " "
  end
  
end
