class PlayerFactory

  def initialize(human_player_model:, input_stream:, computer_player_model:, ai:)
    @human_player_model = human_player_model
    @input_stream = input_stream
    @computer_player_model = computer_player_model
    @ai = ai
  end

end
