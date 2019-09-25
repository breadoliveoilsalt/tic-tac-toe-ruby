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

end
