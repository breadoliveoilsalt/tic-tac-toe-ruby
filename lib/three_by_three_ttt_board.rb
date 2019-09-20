class ThreeByThreeTTTBoard

  def initialize(initial_data=[" ", " ", " ", " ", " ", " ", " ", " ", " "])
    @data = initial_data
  end

  def data
    @data
  end

  def display_board_for_user
    puts board_as_string
  end

  def place_marker_on_board_box(marker, box_number)
    data[box_number-1] = marker
  end

  def game_won?
    (rows + columns + diagonals).each do |row|
      return true if has_win?(row)
    end
    return false
  end

  def has_win?(row) 
    first, middle, last = row
    first != " " && middle = last && first == last
  end

  def rows
    [[data[0], data[1], data[2]],
     [data[3], data[4], data[5]],
     [data[6], data[7], data[8]]]
  end
  
  def columns
    [[data[0], data[3], data[6]],
     [data[1], data[4], data[7]],
     [data[2], data[5], data[8]]]
  end

  def diagonals
    [[data[0], data[4], data[8]],
     [data[6], data[4], data[3]]]
  end

  def game_tied?
    !(there_are_empty_boxes || game_won?)
  end

  def game_over?
    game_won? || game_tied?
  end

  private

  def board_as_string
    <<~MESSAGE
      #{data[0]} | #{data[1]} | #{data[2]} 
     -----------
      #{data[3]} | #{data[4]} | #{data[5]}
     -----------
      #{data[6]} | #{data[7]} | #{data[8]}
    MESSAGE
  end

  def there_are_empty_boxes
    data.include?(" ")
  end
end
