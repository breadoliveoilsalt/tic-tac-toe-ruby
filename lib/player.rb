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
    puts "Please select a marker: X or O."
    user_marker_selection = gets.chomp
    check_user_marker_selection(user_marker_selection)
  end

  def check_user_marker_selection(user_marker_selection)
    if invalid_marker(user_marker_selection)
      puts "Please select only X or O"
      select_marker
    end
  end
  
  def invalid_marker(user_marker_selection)
    user_marker_selection == "X" ||
    user_marker_selection == "x" ||
    user_marker_selection == "O" ||
    user_marker_selection == "o" 
  end

end
