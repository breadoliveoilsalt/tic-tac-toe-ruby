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


# Classes:

# Game
  # Dependency Injections: Board, Prompter, Two Generic Players => inject these into Game as an argument
  # Where does the game logic go? Module called GameRules that Game inherits? 
# Prompter Class? - printing messages to the console.
# Board - data vs logic? Idea: board for setting and getting. GameRules module checks the board. 
# Player
# HumanPlayer
# ComputerPlayer
# Prompter - isolate to TicTacToe
