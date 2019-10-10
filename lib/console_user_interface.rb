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
end
