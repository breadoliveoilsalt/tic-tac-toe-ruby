require_relative './player.rb'

class ThreeByThreeTTTComputerPlayer < Player

  attr_reader :ai
  
  def initialize(ai:)
    @ai = ai
  end
  
  def make_selection(board)
    ai.find_best_move(board)
  end
#    if board.contents_at_box("5") == " "
#      "5"
#    else
#      index_selected = board.data.find_index { |box| box == " " }
#      (index_selected + 1).to_s
#     end
#  end

end
