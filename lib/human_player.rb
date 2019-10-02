require_relative './player.rb'

class HumanPlayer < Player

  attr_accessor :input_stream

  def initialize(input_stream:)
    super
    @input_stream = input_stream
  end
  
  def provide_name
    name = make_selection
  end
 
  def make_selection(*)
    input_stream.read_line
  end
  
end
