require 'require_all'
require_all 'lib'

class GameConfig

  def set_up
    { 
      board: board_config,
      rules: rules_config,
      user_interface: user_interface_config, 
#      players: player_config.set_up
      players: [] 
    }  
  end

  def rules_config
    ThreeByThreeTTTRules.new
  end

  def board_config
    ThreeByThreeTTTBoard.new
  end

  def player_config
    PlayerConfig.new(
      user_interface: user_interface_config,
      player_factory: player_factory_config
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

  def player_factory_config
    PlayerFactory.new(
      human_model: HumanPlayer
      computer_model: ComputerPlayer
      ai: ai_config 
      )
  end

  def ai_config
    Minimax.new(
      rules: rules_config
      )
  end
  

end
