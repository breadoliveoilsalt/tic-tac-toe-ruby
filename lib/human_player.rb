require_relative './player.rb'

class HumanPlayer < Player

  attr_accessor :marker, :name 

  def provide_name
    @name = read_line
  end
 
  def make_selection(*)
    read_line
  end
  
end
