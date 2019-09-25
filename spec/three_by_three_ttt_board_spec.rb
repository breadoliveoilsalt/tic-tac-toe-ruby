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

end
