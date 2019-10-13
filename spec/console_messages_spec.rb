require_relative '../lib/console_messages.rb'
require_relative '../lib/board.rb'

describe ConsoleMessages do 

  let(:console_messages) { ConsoleMessages.new }

  describe "#welcome_simple" do
    it "is a string with a welcome message" do
      expected_message = <<~MESSAGE
        
        Welcome to Tic Tac Toe!

        MESSAGE
      
      expect(console_messages.welcome_simple).to eq(expected_message)
    end
  end

  describe "#instructions" do
    it "is a string with instructions" do 
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
      
      expect(console_messages.instructions).to eq(expected_message)
    end
  end

  describe "#player_type?" do
    it "takes a string number as an argument and returns a question interpolating that number to ask if the player is human or a computer player" do
      player_number = "5"
      expected_return_value = <<~MESSAGE

        Is Player 5 a human or computer player? 

        Enter '1' for human or '2' for computer.
      MESSAGE

      expect(console_messages.player_type?("5")).to eq(expected_return_value)
    end
  end

  describe "#board_with_numbers" do
    it "is a string displaying the board with numbers each box" do
      expected_message = <<~MESSAGE

        1 | 2 | 3 
       -----------
        4 | 5 | 6
       -----------
        7 | 8 | 9
    
      MESSAGE

      expect(console_messages.board_with_numbers).to eq(expected_message)
    end
  end

  describe "#current_board" do
    it "is a string representing the current state of the board" do
      board = Board.new(["X", " ", " ", " ", "X", " ", " ", " ", " "])
      expected_message = <<~MESSAGE

        X |   |              1 | 2 | 3
       -----------          -----------
          | X |              4 | 5 | 6
       -----------          -----------
          |   |              7 | 8 | 9
    
      MESSAGE

      expect(console_messages.current_board(board)).to eq(expected_message)
    end
  end

  describe "#selection_error" do
    it "is a string with a generic error message" do
      expected_message = <<~MESSAGE 

        Sorry, invalid selection.

      MESSAGE
      
      expect(console_messages.selection_error).to eq(expected_message)
    end
  end

  describe "#request_user_select_box" do
    it "is a string with a message for the current player to select a box" do
      player = double
      allow(player).to receive(:name).and_return("Bob")
      expected_message = <<~MESSAGE 

        Bob, please select a box and hit return.

      MESSAGE
      expect(console_messages.request_user_select_box(player)).to eq(expected_message)
    end
  end

  describe "#move_confirmation" do
    it "is a string with a message describing the player's move" do
      player = double
      allow(player).to receive(:name).and_return("Ralph")
      expected_message = <<~MESSAGE 

        Ralph has selected box 5.

      MESSAGE
    
      expect(console_messages.move_confirmation(player, "5")).to eq(expected_message)
    end
  end

  describe "#game_won_by" do
    it "is a string with a message that the winning player won the game" do
      player = double
      allow(player).to receive(:name).and_return("Ralph")
      expected_message = <<~MESSAGE 

        Ralph wins!

        Thanks for playing!

      MESSAGE
    
      expect(console_messages.game_won_by(player)).to eq(expected_message)
    end
  end

  describe "#game_tied" do
    it "is a string with a message that the game ended in a tie" do
      expected_message = <<~MESSAGE 

        Tie game!

        Thanks for playing!

      MESSAGE
      expect(console_messages.game_tied).to eq(expected_message)
    end
  end

  describe "#request_user_play_again" do
    it "is a string asking the user to play again" do
      expected_message = <<~MESSAGE

        Would you like to play again? The next player will go first.

        Enter 'y' or 'Y' to play again.

      MESSAGE
      expect(console_messages.request_user_play_again).to eq(expected_message)
    end
  end

  describe "#good_bye" do 
    it "is a string with a message bidding the user farewell" do
      expected_message = <<~MESSAGE

        Thanks for playing! Good bye!

      MESSAGE
      expect(console_messages.good_bye).to eq(expected_message)
    end
  end
end
