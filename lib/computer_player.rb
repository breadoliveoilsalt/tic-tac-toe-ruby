require_relative './player.rb'

class ComputerPlayer < Player
  
  attr_reader :name, :marker, :ai

  def initialize(attributes)
    @name = attributes[:name] 
    @marker = attributes[:marker]
    @ai = attributes[:ai]
  end

  def make_selection(board, deciding_player, other_player)
    ai.find_best_move(board, deciding_player, other_player)
  end

end
