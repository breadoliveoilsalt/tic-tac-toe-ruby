require_relative './player.rb'

class ThreeByThreeTTTComputerPlayer < Player

  def select_box(board)
    index_selected = board.find_index { |box| box == " " }
    index_selected + 1
  end

end
