require_relative '../lib/human_player.rb'
require_relative '../lib/three_by_three_ttt_computer_player.rb'

class ThreeByThreeTTTPlayerFactory

  attr_accessor :number_of_players, :number_of_human_players

  def initialize(number_of_players: 2, number_of_human_players: 1)
    @number_of_players = number_of_players
    @number_of_human_players = number_of_human_players
  end

  def configure_players
    human_player = HumanPlayer.new
    human_player.marker = "X"
    human_player.name = "User"

    computer_player = ThreeByThreeTTTComputerPlayer.new
    computer_player.marker = "O"
    computer_player.name = "Computer Player"

    [human_player, computer_player]
  end
end
