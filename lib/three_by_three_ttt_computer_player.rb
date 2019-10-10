require_relative './player.rb'
require_relative './minimax.rb'

class ThreeByThreeTTTComputerPlayer < Player
  
  attr_reader :ai

  #def initialize
  #  @ai = Minimax.new
  #end

  def set_ai(ai)
    @ai = ai
  end

  def make_selection(board)
    ai.find_best_move(board)
  end

end
