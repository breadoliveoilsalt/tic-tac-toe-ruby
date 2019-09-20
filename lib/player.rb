class Player

  attr_accessor :marker, :name

  def initialize
    @marker = ""
    @name = "Player"
  end
  
end

class HumanPlayer < Player

  def provide_name
    @name = gets.chomp
    # require 'pry'
    #binding.pry
    #name
    # to Clean up - not sure why Human player instance does
    # not inherit the attr macro of the super class
    # same with #select_marker below
  end
 
  def select_marker
    user_marker_selection = gets.chomp
  end

end
