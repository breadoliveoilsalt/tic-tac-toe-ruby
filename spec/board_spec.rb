require_relative '../lib/board.rb'

describe Board do

  let(:board) { Board.new }

  describe "#new" do
    it "initializes a Board instance with an instance variable @data equal to an array of 9 empty strings" do 
      expected_data = [" "," ", " ", " ", " ", " ", " ", " ", " "]
      expect(board.data).to eq(expected_data)
    end

    it "initializes a Board instance with provided state" do
      prefilled_board = Board.new(["X", "O", "X", " ", " ", " ", " ", " ", " "]) 
      expected_data = ["X", "O", "X", " ", " ", " ", " ", " ", " "]
      expect(prefilled_board.data).to eq(expected_data)
    end
  end

  describe "#place_marker_on_board_box" do
    it "places a marker in the data accoring to the box selected" do 
      board.place_marker_on_board_box("X", "9")
      board.place_marker_on_board_box("O", "5")
      expected_data = [" "," ", " ", " ", "O", " ", " ", " ", "X"]
      expect(board.data).to eq(expected_data)
    end
  end

  describe "#contents_at_box" do
    it "returns the contents of the box passed in as an argument after the board is initialized" do
      expect(board.contents_at_box(1)).to eq(" ")
    end

    it "returns the contents of the box passed in as an argument after the board has been filled with a few markers" do
      board = Board.new(["X", "O", "X", " ", " ", " ", " ", " ", " "])
      expect(board.contents_at_box(3)).to eq("X")
    end
  end

  describe "#clear_board" do
    it "resets the board's data to its default state of 9 strings with empty spaces" do 
      board = Board.new(["X", "O", "X", " ", " ", " ", " ", " ", " "])
      board.clear_board
      expect(board.data).to eq([" "," ", " ", " ", " ", " ", " ", " ", " "])
    end
  end
end
