require_relative './player.rb'

class ThreeByThreeTTTComputerPlayer < Player

  def make_selection(board)
    index_selected = board.data.find_index { |box| box == " " }
    index_selected + 1
  end

end
