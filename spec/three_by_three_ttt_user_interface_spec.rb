require_relative '../lib/three_by_three_ttt_user_interface.rb'
require_relative '../lib/three_by_three_ttt_board.rb'

describe "ThreeByThreeTTTUserInterface" do 

  let(:user_interface) { ThreeByThreeTTTUserInterface.new }

  describe "#render_user_welcome" do
    it "displays a welcome message to the console" do
      expected_message = <<~MESSAGE
        
        Welcome to Tic Tac Toe!

        MESSAGE

      expect{user_interface.render_user_welcome}.to output(expected_message).to_stdout
    end
  end

  describe "#render_instructions" do
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
      
      expect{user_interface.render_instructions}.to output(expected_message).to_stdout
    end
  end

  describe "#render_board_with_numbers" do
    it "displays the board with numbers each box" do
      expected_message = <<~MESSAGE

        1 | 2 | 3 
       -----------
        4 | 5 | 6
       -----------
        7 | 8 | 9
    
      MESSAGE
      expect{user_interface.render_board_with_numbers}.to output(expected_message).to_stdout
    end
  end

  describe "#render_current_board" do
    it "displays the current state of the board" do
      board = ThreeByThreeTTTBoard.new(["X", " ", " ", " ", "X", " ", " ", " ", " "])
      expected_message = <<~MESSAGE

        X |   |  
       -----------
          | X |  
       -----------
          |   |  
    
      MESSAGE
      expect{user_interface.render_current_board(board)}.to output(expected_message).to_stdout
    end
  end

  describe "#render_generic_user_selection_error" do
    it "displays an generic error message to the console" do
      expected_message = <<~MESSAGE 

        Sorry, invalid selection.

      MESSAGE
      expect{user_interface.render_generic_user_selection_error}.to output(expected_message).to_stdout
    end
  end

  describe "#render_request_to_select_box" do
    it "displays a message for the current player to select a box" do
      player = double
      allow(player).to receive(:name).and_return("Bob")
      expected_message = <<~MESSAGE 

        Bob, please select a box and hit return.

      MESSAGE
      expect{user_interface.render_request_to_select_box(player)}.to output(expected_message).to_stdout
    end
  end

  describe "#render_confirmation_of_move" do
    it "displays a message describing the player's move" do
      player = double
      allow(player).to receive(:name).and_return("Ralph")
      expected_message = <<~MESSAGE 

        Ralph has selected box 5.

      MESSAGE
      expect{user_interface.render_confirmation_of_move(player, "5")}.to output(expected_message).to_stdout
    end
  end

  describe "#render_message_game_won_by" do
    it "displays a message that the winning player won the game" do
      player = double
      allow(player).to receive(:name).and_return("Ralph")
      expected_message = <<~MESSAGE 

        Ralph wins!

        Thanks for playing!

      MESSAGE
      expect{user_interface.render_message_game_won_by(player)}.to output(expected_message).to_stdout
    end
  end

  describe "#render_message_game_tied" do
    it "displays a message that the game ended in a tie" do
      expected_message = <<~MESSAGE 

        Tie game!

        Thanks for playing!

      MESSAGE
      expect{user_interface.render_message_game_tied}.to output(expected_message).to_stdout
    end
  end
end
