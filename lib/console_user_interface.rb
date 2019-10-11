class ConsoleUserInterface

  attr_reader :output_stream, :input_stream, :messages

  def initialize(output_stream:, input_stream:, messages:)
    @output_stream = output_stream
    @input_stream = input_stream
    @messages = messages
  end

  def show_welcome
    output_stream.render(messages.welcome)
  end

  def get_player_type(player_number)
    message = messages.player_type?(player_number)
    output_stream.render(message)
    input_stream.read_line
  end

  def get_name
    output_stream.render(messages.name?)
    input_stream.read_line
  end
  
  def get_marker
    output_stream.render(messages.marker?)
    input_stream.read_line
  end

  def show_move_confirmation(player, player_selection)
    output_stream.render(messages.move_confirmation(player, player_selection))
  end  

  def show_current_board(board)
    output_stream.render(messages.current_board(board))
  end

  
  def show_selection_error
    output_stream.render(messages.selection_error)
  end

  def get_user_selection(player)
    output_stream.render(messages.request_user_select_box(player))
    input_stream.read_line
  end
 
  def show_game_won_by(player)
    output_stream.render(messages.game_won_by(player))
  end

  def show_game_tied
    output_stream.render(messages.game_tied)
  end

  def get_user_play_again
    output_stream.render(messages.request_user_play_again)
    input_stream.read_line
  end

  def show_good_bye
    output_stream.render(messages.good_bye)
  end
end
