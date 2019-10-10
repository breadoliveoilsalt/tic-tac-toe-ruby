require 'require_all'
require_all 'lib'

class GameConfig

  def set_up
    { 
      board: ThreeByThreeTTTBoard.new,
      rules: ThreeByThreeTTTRules.new,
      user_interface: user_interface_config, 
#      players: player_config.set_up
      players: [] 
    }  
  end

  def player_config
    PlayerConfig.new(
      output_stream: ConsoleOutputStream.new,
      input_stream: ConsoleInputStream.new
      )
  end

  def output_stream_config
    ConsoleOutputStream.new
  end

  def input_stream_config
    ConsoleInputStream.new
  end

  def messages_config
    ThreeByThreeTTTConsoleMessages.new 
  end

  def user_interface_config
    ConsoleUserInterface.new(
      output_stream: output_stream_config,
      input_stream: input_stream_config,
      messages: messages_config
      )
  end
end
