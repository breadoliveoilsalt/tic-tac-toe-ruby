require_relative '../lib/human_player.rb'
require_relative '../lib/three_by_three_ttt_computer_player.rb'

class ThreeByThreeTTTPlayerFactory

  attr_accessor :number_of_players, :number_of_human_players, :players

  def initialize(number_of_players: 2, number_of_human_players: 1)
    @number_of_players = number_of_players
    @number_of_human_players = number_of_human_players
    @players = []
  end

  def configure_players
    configure_human_players
    configure_computer
    players
  end

  def configure_human_player
    human_player = HumanPlayer.new
    human_player.marker = "X"
    human_player.name = "User"
    players.push(human_player)
  end

  def configure_computer_players
    computer_player = ThreeByThreeTTTComputerPlayer.new
    computer_player.marker = "O"
    computer_player.name = "Computer Player"
    players.push(computer_player)
  end

end
