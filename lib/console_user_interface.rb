class ConsoleUserInterface

  attr_reader :output_stream, :input_stream, :messages

  def initialize(output_stream:, input_stream:, messages:)
    @output_stream = output_stream
    @input_stream = input_stream
    @messages = messages
  end

end
