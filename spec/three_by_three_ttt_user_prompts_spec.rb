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
        Players take turns selecting empty boxes.
        A player selects a box by picking a number corresponding
        to that box. 
        A player wins by filling a row, column, or diagonal 
        with only that player's marker.
        If all boxes are filled without a win, the game is a tie.

        MESSAGE

      expect{test_object.provide_instructions}.to output(expected_message).to_stdout
    end
  end
end
