class ThreeByThreeTTTBoard

  def initialize(initial_data=[" ", " ", " ", " ", " ", " ", " ", " ", " "])
    @data = initial_data
  end

  def data
    @data
  end

  def place_marker_on_board_box(marker, box_number)
    data[box_number - 1] = marker
  end
  
#  def game_won?
#    (rows + columns + diagonals).each do |row|
#      return true if has_win?(row)
#    end
#    false
#  end

  def has_win?(row) 
    first, middle, last = row
    first != " " && first == middle && first == last
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
     [data[6], data[4], data[2]]]
  end

  def game_tied?
    !(there_are_empty_boxes || game_won?)
  end

  def game_over?
    game_won? || game_tied?
  end

  def valid_move?(box_number)
    valid_box_number?(box_number) && box_is_empty?(box_number)
  end

  private

  def there_are_empty_boxes
    data.include?(" ")
  end

  def valid_box_number?(box_number)
    box_number.is_a?(Integer) && box_number >= 1 && box_number <= 9
  end

end
