require 'pp'

module Instructions

  def print_board
    pp board 
    # This shows that a module has access to a class's 
    # instance variables (including those revealed with
    # attr.
  end  

end

class BaseClass

  include Instructions
  
  attr_accessor :board

  def initialize
    @board = []
  end

end


BaseClass.new.print_board
