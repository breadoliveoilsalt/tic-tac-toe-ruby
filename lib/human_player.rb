require_relative './player.rb'

class HumanPlayer < Player

  attr_accessor :name, :marker, :input_stream

  def initialize(input_stream:, name:, marker:)
    super
    @input_stream = input_stream
    @name = name
    @marker = marker
      # TO TEST ABOVE
  end
  
  def provide_name
    @name = input_stream.read_line
  end
 
  def make_selection(*)
    input_stream.read_line
  end
  
end
