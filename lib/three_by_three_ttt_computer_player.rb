require_relative './player.rb'

class ThreeByThreeTTTComputerPlayer < Player
  
  attr_reader :ai

  def set_ai(ai)
    @ai = ai
  end

  def make_selection(board)
    @ai.find_best_move(board)
  end

end
