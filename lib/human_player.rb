require_relative './player.rb'

class HumanPlayer < Player

  attr_reader :name, :marker, :user_interface

  def initialize(attributes)
    @name = attributes[:name]
    @marker = attributes[:marker]
    @user_interface = attributes[:user_interface]
  end
  
  def make_selection(*)
    user_interface.get_user_selection(self)
  end
  
end
