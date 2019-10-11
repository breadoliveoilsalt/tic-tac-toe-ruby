require_relative './player.rb'

class HumanPlayer < Player

  attr_reader :name, :marker, :user_interface

  def initialize(attributes)
    @name = attributes[:name]
    @marker = attributes[:marker]
    @user_interface = attributes[:user_interface]
  end
  
  def make_selection(*)
    user_interface.read_line
  end
#  def provide_name
#    @name = input_stream.read_line
#  end
# 
#  def make_selection(*)
#    input_stream.read_line
#  end
  
end
