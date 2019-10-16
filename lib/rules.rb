class Rules 
  
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

  def game_won?(board)
    potentially_winning_paths = get_potentially_winning_paths(board)
    potentially_winning_paths.each do |path|
      return true if has_win?(path)
    end
    false
  end

  def player_won_game?(board, player)
    potentially_winning_paths = get_potentially_winning_paths(board)
    potentially_winning_paths.each do |path|
      return true if has_win?(path) && path[0] == player.marker
    end
    false
  end
 
 def game_tied?(board)
    !(there_are_empty_boxes(board) || game_won?(board))
  end

  def game_over?(board)
    game_won?(board) || game_tied?(board)
  end

  def box_is_empty?(board, box_number)
    data_location = get_data_location_corresponding_to(box_number)
    board.data[data_location] == " "
  end

  private 

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

  def get_potentially_winning_paths(board)
    rows(board) + columns(board) + diagonals(board)
  end

  def has_win?(path) 
    first, middle, last = path
    first != " " && first == middle && first == last
  end
  
  def rows(board)
    [[board.data[0], board.data[1], board.data[2]],
     [board.data[3], board.data[4], board.data[5]],
     [board.data[6], board.data[7], board.data[8]]]
  end
  
  def columns(board)
    [[board.data[0], board.data[3], board.data[6]],
     [board.data[1], board.data[4], board.data[7]],
     [board.data[2], board.data[5], board.data[8]]]
  end

  def diagonals(board)
    [[board.data[0], board.data[4], board.data[8]],
     [board.data[6], board.data[4], board.data[2]]]
  end

  def there_are_empty_boxes(board)
    board.data.include?(" ")
  end

end
