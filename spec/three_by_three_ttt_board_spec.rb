require_relative '../lib/three_by_three_ttt_board.rb'

describe ThreeByThreeTTTBoard do

  let(:board) { ThreeByThreeTTTBoard.new }

  describe "#new" do
    it "initializes a Board instance with an instance variable @data equal to an array of 9 empty strings" do 
      expected_data = [" "," ", " ", " ", " ", " ", " ", " ", " "]
      expect(board.data).to eq(expected_data)
    end

    it "initializes a Board instance with provided state" do
      prefilled_board = ThreeByThreeTTTBoard.new(["X", "O", "X", " ", " ", " ", " ", " ", " "]) 
      expected_data = ["X", "O", "X", " ", " ", " ", " ", " ", " "]
      expect(prefilled_board.data).to eq(expected_data)
    end
  end

  describe "#place_marker_on_board_box" do
    it "places a marker in the data accoring to the box selected" do 
      board.place_marker_on_board_box("X", 9)
      expected_data = [" "," ", " ", " ", " ", " ", " ", " ", "X"]
      expect(board.data).to eq(expected_data)
    end
  end

  describe "#game_tied?" do
    xit "returns false when all boxes are empty" do
      expect(board.game_tied?). to eq(false)
    end

    xit "returns false when the game is won" do 
      board = ThreeByThreeTTTBoard.new(
        ["X", "X", "X", 
         " ", " ", " ", 
         " ", " ", " "]
      )
      expect(board.game_tied?).to eq(false)
    end

    xit "returns false when the game is not won but there are empty boxes" do
      board = ThreeByThreeTTTBoard.new(
        ["X", " ", "X", 
         " ", " ", " ", 
         " ", " ", " "]
      )
      expect(board.game_tied?).to eq(false)
    end
  end

  describe "#game_over?" do 
    xit "returns false upon initialization when board is empty" do
      expect(board.game_over?).to eq(false)
    end

    xit "returns true when the game is won" do
      board = ThreeByThreeTTTBoard.new(
        ["X", "X", "X", 
         " ", " ", " ", 
         " ", " ", " "]
      )
      expect(board.game_over?).to eq(true)
    end
    
    xit "returns true when the game is tied" do
      board = ThreeByThreeTTTBoard.new(
        ["X", "X", "O", 
         "O", "O", "X", 
         "X", "X", "O"]
      )
      expect(board.game_over?).to eq(true)
    end
  end

  describe "#rows" do
    xit "returns all the board's rows" do
      board = ThreeByThreeTTTBoard.new(
        ["X", "X", "O", 
         "O", "O", "X", 
         "X", "X", "O"]
      )
      expect(board.rows).to eq(
        [["X", "X", "O"], 
         ["O", "O", "X"], 
         ["X", "X", "O"]]
      )
    end
  end
  
  describe "#columns" do
    it "returns all the board's columns" do
      board = ThreeByThreeTTTBoard.new(
        ["X", "X", "O", 
         "O", "O", "X", 
         "X", "X", "O"]
      )
      expect(board.columns).to eq(
        [["X", "O", "X"], 
         ["X", "O", "X"], 
         ["O", "X", "O"]]
      )
    end
  end
  
  describe "#columns" do
    it "returns all the board's diagonals" do
      board = ThreeByThreeTTTBoard.new(
        ["X", "X", "O", 
         "O", "O", "X", 
         "X", "X", "O"]
      )
      expect(board.diagonals).to eq(
        [["X", "O", "O"], 
         ["X", "O", "O"]]
      )
    end
  end

end
