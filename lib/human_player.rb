require_relative './player.rb'

require_relative './user_console_input.rb'

class HumanPlayer < Player

  attr_accessor :name, :marker, :input_stream

  def initialize(input_stream:)
    super
    @input_stream = input_stream
  end
  
  def provide_name
    @name = input_stream.read_line
  end
 
  def make_selection(*)
    input_stream.read_line
  end
  
end

#i = UserConsoleInput.new
#h = HumanPlayer.new(input_stream: i)
#h.provide_name
#puts h.name
