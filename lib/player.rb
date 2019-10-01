require_relative './user_input.rb'

class Player < UserInput

  attr_accessor :marker, :name

  def initialize
    @marker = ""
    @name = "Player"
  end
  
end
