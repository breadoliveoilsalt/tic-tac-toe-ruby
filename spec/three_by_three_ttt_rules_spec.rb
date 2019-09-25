require_relative '../lib/three_by_three_ttt_rules.rb'
require_relative '../lib/three_by_three_ttt_board.rb'

#class TestObject
#  include ThreeByThreeTTTRules
#  
#  def initialize
#    @board = ThreeByThreeTTTBoard.new
#  end
#end

describe "ThreeByThreeTTTRules" do

  let(:rules) { ThreeByThreeTTTRules.new }
  let(:board) { ThreeByThreeTTTBoard.new }

  describe "#box_is_empty?" do 

    it "returns true when the box number passed in is equal to a string with a space" do
      expect(rules.box_is_empty?(board, 3)). to eq(true)
    end

    it "returns false when the box number passed in is not equal to a string with a space" do
      board = ThreeByThreeTTTBoard.new(
        [" ", " ", "X", 
         " ", " ", " ", 
         " ", " ", " "]
      )
      expect(rules.box_is_empty?(board, 3)). to eq(false)
    end
  
  end
  
end
