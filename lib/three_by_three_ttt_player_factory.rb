require_relative '../lib/human_player.rb'
require_relative '../lib/three_by_three_ttt_computer_player.rb'
require_relative '../lib/console_input_stream.rb'

class ThreeByThreeTTTPlayerFactory

  attr_accessor :number_of_players, :number_of_human_players, :players, :human_player_model, :input_stream, :computer_player_model

  def initialize(
    number_of_players: 2, 
    number_of_human_players: 1, 
    human_player_model: HumanPlayer,
    input_stream: ConsoleInputStream,
    computer_player_model: ThreeByThreeTTTComputerPlayer
    )
    @number_of_players = number_of_players
    @number_of_human_players = number_of_human_players
    @players = []
    @human_player_model = human_player_model
    @input_stream = input_stream
    @computer_player_model = computer_player_model
  end

  def configure_players
    configure_human_players
    configure_computer_players
    players
  end

  def configure_human_players
    user_input_stream = input_stream.new
    human_player = human_player_model.new(input_stream: user_input_stream)
    human_player.marker = "X"
    human_player.name = "User"
    players.push(human_player)
  end

  def configure_computer_players
    computer_player = computer_player_model.new
    computer_player.marker = "O"
    computer_player.name = "Computer Player"
    players.push(computer_player)
  end

end
