require_relative '../lib/board.rb'

describe Board do

  before(:each) do 
    @board = Board.new
  end

  describe "#new" do
    it "initializes a Board instance with an instance variable @data equal to an array of 9 empty strings" do 
      expected_output = ["","","","","","","","",""]
      expect(@board.data).to eq(expected_output)
    end
  end

  describe "#display_for_user" do
    xit "prints a user friendly version of the current board to the terminal" do
      
    end
  end

  describe "mock puts test" do 
    it "hopefully passes" do
      expect{ @board.test_message }.to output("Success!").to_stdout
    end
  end
end
