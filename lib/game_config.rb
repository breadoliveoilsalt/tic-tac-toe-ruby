require 'require_all'
require_all 'lib'

class GameConfig

  def set_up
    { 
      board: ThreeByThreeTTTBoard.new,
      rules: ThreeByThreeTTTRules.new,
      output_stream: ConsoleOutputStream.new,
      user_view: ThreeByThreeTTTUserView.new,
      players: ThreeByThreeTTTPlayerFactory.new.configure_players
    }  
  end
end
