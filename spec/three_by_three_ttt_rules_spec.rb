require_relative '../lib/three_by_three_ttt_rules.rb'
require_relative '../lib/three_by_three_ttt_board.rb'

describe "ThreeByThreeTTTRules" do

  let(:rules) { ThreeByThreeTTTRules.new }
  let(:board) { ThreeByThreeTTTBoard.new }

# Is this a private method?
#  describe "#box_is_empty?" do 
#
#    it "returns true when the box number passed in is equal to a string with a space" do
#      expect(rules.box_is_empty?(board, 3)). to eq(true)
#    end
#
#    it "returns false when the box number passed in is not equal to a string with a space" do
#      board = ThreeByThreeTTTBoard.new(
#        [" ", " ", "X", 
#         " ", " ", " ", 
#         " ", " ", " "]
#      )
#      expect(rules.box_is_empty?(board, 3)). to eq(false)
#    end
#  
#  end
  
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

  describe "#valid_move?" do
    it "returns true when it is passed the box number for an empty box" do
      expect(rules.valid_move?(board, "1")).to eq(true)
    end
    
    it "returns false when it is passed the box number for a taken box" do
      board = ThreeByThreeTTTBoard.new(
        ["X", " ", " ", 
         " ", " ", " ", 
         " ", " ", " "]
      )
      expect(rules.valid_move?(board, "1")).to eq(false)
    end
    
    it "returns false when it is passed an argument that is not an integer between 1 and 9" do
      expect(rules.valid_move?(board, "100")).to eq(false)
      expect(rules.valid_move?(board, "3.5")).to eq(false)
      expect(rules.valid_move?(board, "apple")).to eq(false)
    end
  end
  
  describe "#game_won?" do
    it "returns false when all boxes are empty" do
      expect(rules.game_won?(board)).to eq(false)
    end

    it "returns true when the first row consists of the same markers and not blank spaces" do 
      board = ThreeByThreeTTTBoard.new(
        ["X", "X", "X", 
         " ", " ", " ", 
         " ", " ", " "]
      )
      expect(rules.game_won?(board)).to eq(true)
    end

    it "returns true when the same markers are on left-to-right diagonal" do 
      board = ThreeByThreeTTTBoard.new(
        ["O", " ", " ", 
         " ", "O", " ", 
         " ", " ", "O"]
      )
      expect(rules.game_won?(board)).to eq(true)
    end
  end
  
  describe "#game_tied?" do
    it "returns false when all boxes are empty" do
      expect(rules.game_tied?(board)). to eq(false)
    end

    it "returns false when the game is won" do 
      board = ThreeByThreeTTTBoard.new(
        ["X", "X", "X", 
         " ", " ", " ", 
         " ", " ", " "]
      )
      expect(board.game_tied?).to eq(false)
    end

    it "returns false when the game is not won but there are empty boxes" do
      board = ThreeByThreeTTTBoard.new(
        ["X", " ", "X", 
         " ", " ", " ", 
         " ", " ", " "]
      )
      expect(board.game_tied?).to eq(false)
    end
  end

end
