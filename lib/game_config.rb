require 'require_all'
require_all 'lib'

class GameConfig

  def set_up
    { 
      board: ThreeByThreeTTTBoard.new,
      rules: ThreeByThreeTTTRules.new,
      output_stream: ConsoleOutputStream.new,
      user_view: ThreeByThreeTTTUserView.new,
#      players: player_config.set_up
      players: ThreeByThreeTTTPlayerFactory.new.configure_players
    }  
  end

  def player_config
    PlayerConfig.new(
      output_stream: ConsoleOutputStream.new,
      input_stream: ConsoleInputStream.new
      )
  end
end
