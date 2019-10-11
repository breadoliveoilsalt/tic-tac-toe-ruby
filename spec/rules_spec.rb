require_relative '../lib/rules.rb'
require_relative '../lib/board.rb'

describe "Rules" do

  let(:rules) { Rules.new }
  let(:board) { Board.new }

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
      board = Board.new(
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
      board = Board.new(
        ["X", "X", "X", 
         " ", " ", " ", 
         " ", " ", " "]
      )
      expect(rules.game_won?(board)).to eq(true)
    end

    it "returns true when the same markers are on left-to-right diagonal" do 
      board = Board.new(
        ["O", " ", " ", 
         " ", "O", " ", 
         " ", " ", "O"]
      )
      expect(rules.game_won?(board)).to eq(true)
    end
  end
  
  describe "#player_won_game?(board, player)" do 
    
    it "returns true when the player has won the game" do 
      board = Board.new(
        ["X", " ", " ", 
         " ", "X", " ", 
         " ", " ", "X"]
      )
      player = double("PlayerX", :marker => "X")

      expect(rules.player_won_game?(board, player)).to eq(true)
    end

    it "returns false when the player has not won the game" do 
      board = Board.new(
        ["X", " ", " ", 
         " ", "X", " ", 
         " ", " ", "X"]
      )
      player = double("PlayerX", :marker => "O")

      expect(rules.player_won_game?(board, player)).to eq(false)
    end

  end

  describe "#game_tied?" do
    it "returns false when all boxes are empty" do
      expect(rules.game_tied?(board)). to eq(false)
    end

    it "returns false when the game is won" do 
      board = Board.new(
        ["X", "X", "X", 
         " ", " ", " ", 
         " ", " ", " "]
      )
      expect(rules.game_tied?(board)).to eq(false)
    end

    it "returns false when the game is not won but there are empty boxes" do
      board = Board.new(
        ["X", " ", "X", 
         " ", " ", " ", 
         " ", " ", " "]
      )
      expect(rules.game_tied?(board)).to eq(false)
    end
  end

  describe "#game_over?" do 
    it "returns false upon initialization when board is empty" do
      expect(rules.game_over?(board)).to eq(false)
    end

    it "returns true when the game is won" do
      board = Board.new(
        ["X", "X", "X", 
         " ", " ", " ", 
         " ", " ", " "]
      )
      expect(rules.game_over?(board)).to eq(true)
    end
    
    it "returns true when the game is tied" do
      board = Board.new(
        ["X", "X", "O", 
         "O", "O", "X", 
         "X", "X", "O"]
      )
      expect(rules.game_over?(board)).to eq(true)
    end
  end
end
