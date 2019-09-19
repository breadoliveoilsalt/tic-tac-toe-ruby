class Board

  def initialize
    @data = initial_data
  end

  def data
    @data
  end

  def initial_data
    [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display_board_for_user
    puts board_as_string
  end

  def board_as_string
    <<~MESSAGE
      #{data[0]} | #{data[1]} | #{data[2]} 
     -----------
      #{data[3]} | #{data[4]} | #{data[5]}
     -----------
      #{data[6]} | #{data[7]} | #{data[8]}
    MESSAGE
  end

  def place_marker_in_board_box(marker, box_number)
    data[box_number-1] = marker
  end

end
