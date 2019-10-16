require 'require_all' 
require_all 'lib' 

class GameConfig

  def set_up
    { 
      board: board_config,
      rules: rules_config,
      user_interface: user_interface_config, 
      players: player_config
    }  
  end

  private

  def board_config
    Board.new
  end

  def rules_config
    Rules.new
  end

  def user_interface_config
    ConsoleUserInterface.new(
      output_stream: output_stream_config,
      input_stream: input_stream_config,
      messages: messages_config
      )
  end

  def output_stream_config
    ConsoleOutputStream.new
  end

  def input_stream_config
    ConsoleInputStream.new
  end

  def messages_config
    ConsoleMessages.new 
  end

  def player_config
    PlayerConfig.new(
      user_interface: user_interface_config,
      human_player_model: HumanPlayer,
      computer_player_model: ComputerPlayer,
      ai: ai_config
      ).set_up
  end
  
  def ai_config
    Minimax.new(
      rules: rules_config
      )
  end
  
end
