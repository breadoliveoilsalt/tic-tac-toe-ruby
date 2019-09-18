class Player

  attr_accessor :marker, :name

  def initialize
    @marker = ""
    @name = "Player"
  end
  
end

class HumanPlayer < Player

#  def set_name
#    human_player_name = gets.chom
#  end
end
