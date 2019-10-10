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
   
end
