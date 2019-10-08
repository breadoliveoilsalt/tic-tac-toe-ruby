class ThreeByThreeTTTPlayerConfig

  attr_reader :output_stream, :input_stream

  def initialize(output_stream:, input_stream:)
    @output_stream = output_stream
    @input_stream = input_stream
  end

  def set_up
    render_welcome_message_to_user
    cycle_through_players
  end

  def render_welcome_message_to_user 
    output_stream.render(welcome_message)
  end

  def cycle_through_players
    output_stream.render(is_player_human_message?("1"))
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

  def is_player_human_message?(player_number)
    <<~MESSAGE

      Is Player #{player_number} a human or computer player? 

      Enter '1' for human or '2' for computer.

    MESSAGE

  end
end