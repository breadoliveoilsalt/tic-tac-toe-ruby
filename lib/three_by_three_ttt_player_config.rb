class ThreeByThreeTTTPlayerConfig

  attr_reader :output_stream, :input_stream

  def initialize(output_stream:, input_stream:)
    @output_stream = output_stream
    @input_stream = input_stream
  end

  def set_up
    output_stream.render(welcome_message)
  end
   
  def welcome_message
    <<~MESSAGE

      ~~~~~~~~~~~~~~~~~~~~~~
      ~~~~~~~~~~~~~~~~~~~~~~

      Welcome to Tic Tac Toe!

            ----------

      Tic Tac Toe is a 2 Player Game.

    MESSAGE
  end
end
