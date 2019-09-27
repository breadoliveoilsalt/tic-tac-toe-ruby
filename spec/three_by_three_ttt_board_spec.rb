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
      board = ThreeByThreeTTTBoard.new(["X", "O", "X", " ", " ", " ", " ", " ", " "])
      expect(board.contents_at_box(3)).to eq("X")
    end
  end
end
