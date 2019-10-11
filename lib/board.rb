class Board

  def initialize(initial_data=[" ", " ", " ", " ", " ", " ", " ", " ", " "])
    @data = initial_data
  end

  def place_marker_on_board_box(marker, box_number)
    data[box_number.to_i - 1] = marker
  end

  def contents_at_box(box_number)
    data[box_number.to_i - 1]
  end

  def clear_board
    @data = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def data
    @data
  end

end
