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

  def get_marker
    output_stream.render(messages.marker?)
    input_stream.read_line
  end

end
