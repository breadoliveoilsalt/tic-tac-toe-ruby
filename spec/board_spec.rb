require_relative '../lib/board.rb'

describe Board do

  before(:each) do 
    @board = Board.new
  end

  describe "#new" do
    it "initializes a Board instance with an instance variable @data equal to an array of 9 empty strings" do 
      expected_output = [" "," ", " ", " ", " ", " ", " ", " ", " "]
      expect(@board.data).to eq(expected_output)
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
  end

end
