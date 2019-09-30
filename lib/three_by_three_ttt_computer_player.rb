require_relative './player.rb'

class ThreeByThreeTTTComputerPlayer < Player

  def make_selection(board)
    if board.data[4] == " "
      "5"
    else
      index_selected = board.data.find_index { |box| box == " " }
      (index_selected + 1).to_s
     end
  end

end
