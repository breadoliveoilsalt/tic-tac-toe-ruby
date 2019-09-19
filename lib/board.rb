class Board

  WINNING_POSITIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

  def initialize
    @data = initial_data
  end

  def display_board_for_user
    puts board_as_string
  end

  def place_marker_on_board_box(marker, box_number)
    data[box_number-1] = marker
  end

  def game_won?
    there_is_a_winner = false
    WINNING_POSITIONS.each do |positions|
      if data[positions[0]] != " " && data[positions[0]] == data[positions[1]] && data[positions[0]] == data[positions[2]]
        there_is_a_winner = true
      end
    end
    there_is_a_winner
  end

  #private - tests won't pass with private label - TBD
  
  def data
    @data
  end

  def initial_data
    [" ", " ", " ", " ", " ", " ", " ", " ", " "]
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

end
