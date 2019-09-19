require_relative '../lib/board.rb'

describe Board do

  before(:each) do 
    @board = Board.new
  end

  describe "#new" do
    it "initializes a Board instance with an instance variable @data equal to an array of 9 empty strings" do 
      expected_data = [" "," ", " ", " ", " ", " ", " ", " ", " "]
      expect(@board.data).to eq(expected_data)
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

      expect{ @board.display_board_for_user}.to output(expected_message_to_terminal).to_stdout
    end

    it "prints to the terminal a user friendly version of the board that reflects past moves" do
      @board.data[0] = "X"
      @board.data[8] = "O"
      expected_message_to_terminal = <<~MESSAGE
         X |   |   
        -----------
           |   |  
        -----------
           |   | O
      MESSAGE
      expect{ @board.display_board_for_user}.to output(expected_message_to_terminal).to_stdout
    end
  end

  describe "#place_marker_on_board_box" do
    it "places a marker in the data accoring to the box selected" do 
      @board.place_marker_on_board_box("X", 9)
      expected_data = [" "," ", " ", " ", " ", " ", " ", " ", "X"]
      expect(@board.data).to eq(expected_data)
    end
  end

  describe "#game_won?" do
    it "returns false when all boxes are empty" do
      expect(@board.game_won?).to eq(false)
    end

    it "returns true when the first row consists of the same markers" do 
      @board.data[0] = "X"
      @board.data[1] = "X"
      @board.data[2] = "X"
      expect(@board.game_won?).to eq(true)
    end
  end
end
