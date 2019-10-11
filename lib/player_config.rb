class PlayerConfig

  attr_reader :output_stream, :input_stream

  def initialize(user_interface:, player_factory:, human_player_model:, computer_player_model:, ai:)
    @user_interface = user_interface
    @player_factory = player_factory
    @human_player_model = human_player_model
    @computer_player_model = computer_player_model
    @ai = ai
  end

  def set_up
  end

  def cycle_through_players
  end
   
end
