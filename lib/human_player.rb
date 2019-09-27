require_relative './player.rb'

class HumanPlayer < Player

  attr_accessor :marker, :name 

  def provide_name
    @name = gets.chomp
  end
 
  def make_selection(*)
    user_selection = gets.chomp
    user_selection
  end
  
end
