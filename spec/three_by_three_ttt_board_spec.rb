require_relative '../lib/three_by_three_ttt_board.rb'

describe ThreeByThreeTTTBoard do

  before(:each) do 
    @board = ThreeByThreeTTTBoard.new
  end

  def board
    @board
  end
  
  describe "#new" do
    it "initializes a Board instance with an instance variable @data equal to an array of 9 empty strings" do 
      expected_data = [" "," ", " ", " ", " ", " ", " ", " ", " "]
      expect(board.data).to eq(expected_data)
    end
  end

  describe "#display_board_for_user" do
    it "prints to terminal a user friendly version of the board that is empty after initialization" do
      expected_message_to_terminal = <<~MESSAGE
           |   |   
        -----------
           |   |  
        -----------
           |   |  
      MESSAGE

      expect{ board.display_board_for_user}.to output(expected_message_to_terminal).to_stdout
    end

    it "prints to the terminal a user friendly version of the board that reflects past moves" do
      board.data[0] = "X"
      board.data[8] = "O"
      expected_message_to_terminal = <<~MESSAGE
         X |   |   
        -----------
           |   |  
        -----------
           |   | O
      MESSAGE
      expect{ board.display_board_for_user}.to output(expected_message_to_terminal).to_stdout
    end
  end

  describe "#place_marker_on_board_box" do
    it "places a marker in the data accoring to the box selected" do 
      board.place_marker_on_board_box("X", 9)
      expected_data = [" "," ", " ", " ", " ", " ", " ", " ", "X"]
      expect(board.data).to eq(expected_data)
    end
  end

  describe "#game_won?" do
    it "returns false when all boxes are empty" do
      expect(board.game_won?).to eq(false)
    end

    it "returns true when the first row consists of the same markers and not blank spaces" do 
      board.place_marker_on_board_box("X", 1)
      board.place_marker_on_board_box("X", 2)
      board.place_marker_on_board_box("X", 3)
      expect(board.game_won?).to eq(true)
    end

    it "returns true when the same markers on left-to-right diagonal" do 
      board.place_marker_on_board_box("O", 1)
      board.place_marker_on_board_box("O", 5)
      board.place_marker_on_board_box("O", 9)
      expect(board.game_won?).to eq(true)
    end
  end

  describe "game_tied?" do
    it "returns false when all boxes are empty" do
      expect(board.game_tied?). to eq(false)
    end

    it "returns false when the game is won" do 
      board.place_marker_on_board_box("X", 1)
      board.place_marker_on_board_box("X", 2)
      board.place_marker_on_board_box("X", 3)
      expect(board.game_tied?).to eq(false)
    end

    it "returns false when the game is not won but there are empty boxes" do
      board.place_marker_on_board_box("X", 1)
      board.place_marker_on_board_box("O", 2)
      board.place_marker_on_board_box("X", 3)
      expect(board.game_tied?).to eq(false)
    end
  end

  describe "game_over?" do 
    it "returns true when the game is won" do
      board.place_marker_on_board_box("X", 1)
      board.place_marker_on_board_box("X", 2)
      board.place_marker_on_board_box("X", 3)
      expect(board.game_over?).to eq(false)
    end
  end
end
