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
  
  describe "#valid_marker?" do
    it "returns true if passed a capital X" do
      expect(rules.valid_marker?("X")).to eq(true)
    end
    
    it "returns true if passed a lower case x" do
      expect(rules.valid_marker?("x")).to eq(true)
    end
    
    it "returns true if passed a capital O" do
      expect(rules.valid_marker?("O")).to eq(true)
    end
    
    it "returns true if passed a lower case o" do
      expect(rules.valid_marker?("o")).to eq(true)
    end
    
    it "returns false if passed any other character" do 
      expect(rules.valid_marker?("4")).to eq(false)
      expect(rules.valid_marker?("Y")).to eq(false)
      expect(rules.valid_marker?("p")).to eq(false)
    end
  end

#  describe "#game_won?" do
#    it "returns false when all boxes are empty" do
#      expect(rules.game_won?(board)).to eq(false)
#    end
#
#    it "returns true when the first row consists of the same markers and not blank spaces" do 
#      board = ThreeByThreeTTTBoard.new(
#        ["X", "X", "X", 
#         " ", " ", " ", 
#         " ", " ", " "]
#      )
#      expect(board.game_won?).to eq(true)
#    end
#
#    it "returns true when the same markers are on left-to-right diagonal" do 
#      board = ThreeByThreeTTTBoard.new(
#        ["O", " ", " ", 
#         " ", "O", " ", 
#         " ", " ", "O"]
#      )
#      expect(board.game_won?).to eq(true)
#    end
#  end
end
