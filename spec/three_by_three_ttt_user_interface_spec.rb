require_relative '../lib/three_by_three_ttt_user_interface.rb'

describe "ThreeByThreeTTTUserInterface" do 

  let(:user_interface) { ThreeByThreeTTTUserInterface.new }

  describe "#welcome_user" do
    it "displays a welcome message to the console" do
      expected_message = <<~MESSAGE
        
        Welcome to Tic Tac Toe!

        MESSAGE

      expect{user_interface.welcome_user}.to output(expected_message).to_stdout
    end
  end

  describe "#provide_instructions" do
    it "displays the instructions in the console" do
      expected_message = <<~MESSAGE
        
        Instructions: 

        There are two players. 
        Player 1's marker is "X" and Player 2's marker is "O".  
        Players take turns selecting empty boxes on a board.
        A player wins by filling a row, column, or diagonal on
        the board with only that player's marker.
        If all boxes on the board are filled without a win, 
        the game is a tie.
        
        A player selects a box by picking a number corresponding
        to that box, as indicated on the board below:

          1 | 2 | 3 
         -----------
          4 | 5 | 6
         -----------
          7 | 8 | 9
    
      MESSAGE
      
      expect{user_interface.provide_instructions}.to output(expected_message).to_stdout
    end
  end

  describe "#display_board_with_numbers" do
    it "displays the board with numbers each box" do
      expected_message = <<~MESSAGE

        1 | 2 | 3 
       -----------
        4 | 5 | 6
       -----------
        7 | 8 | 9
    
      MESSAGE
      expect{user_interface.display_board_with_numbers}.to output(expected_message).to_stdout
    end
  end

  describe "#display_generic_user_selection_errror" do
    it "displays an generic error message to the console" do
      expected_message = <<~MESSAGE 

        Sorry, invalid selection.

      MESSAGE
      expect{user_interface.display_generic_user_selection_error}.to output(expected_message).to_stdout
    end
  end

  describe "#request_user_select_box" do
    it "displays a message for the current player to select a box" do
      expected_message = <<~MESSAGE 

        Bob, please select a box and hit return.

      MESSAGE
    end
  end
end
