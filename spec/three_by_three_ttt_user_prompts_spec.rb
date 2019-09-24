require_relative '../lib/three_by_three_ttt_user_prompts.rb'

class TestObject
  include ThreeByThreeTTTUserPrompts
end

describe "ThreeByThreeTTTUserPrompts" do 

  let(:test_object) { TestObject.new }

#  before(:each) do
#    test_object = Object.new
#    test_object.extend(ThreeByThreeTTTUserPrompts)
#  end

  describe "#welcome_user" do
    it "displays a welcome message to the console" do
      expected_message = <<~MESSAGE
        
        Welcome to Tic Tac Toe!

        MESSAGE

      expect{test_object.welcome_user}.to output(expected_message).to_stdout
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
      
      expect{test_object.provide_instructions}.to output(expected_message).to_stdout
    end
  end

  describe "#display_board_with_numbers" do
    it "displays a the board with numbers each box" do
      expected_message = <<~MESSAGE
        1 | 2 | 3 
       -----------
        4 | 5 | 6
       -----------
        7 | 8 | 9
    
      MESSAGE
      expect{test_object.display_board_with_numbers}.to output(expected_message).to_stdout
    end

  end
end
