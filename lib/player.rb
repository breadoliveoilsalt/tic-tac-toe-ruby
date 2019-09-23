class Player

  attr_accessor :marker, :name

  def initialize
    @marker = ""
    @name = "Player"
  end
  
end

class HumanPlayer < Player

  attr_accessor :marker, :name # why does subclass not inherit attr from superclass?

  def provide_name
    @name = gets.chomp
  end
 
  def select_marker
    user_selection = gets.chomp
    user_selection
  end

end
