class PlayerConfig

  attr_reader :user_interface, :player_factory, :human_player_model, :computer_player_model, :ai

  def initialize(user_interface:, player_factory:, human_player_model:, computer_player_model:, ai:)
    @user_interface = user_interface
    @player_factory = player_factory
    @human_player_model = human_player_model
    @computer_player_model = computer_player_model
    @ai = ai
  end

  def set_up
    user_interface.show_welcome

    players = [ ]
    ["1", "2"].each do | player_number |
      player_type = user_interface.get_player_type(player_number)
      if player_type == "1"
        player = human_player_model.new
        players.push(player)
      end
    end
  end

  def cycle_through_players
  end
   
end
