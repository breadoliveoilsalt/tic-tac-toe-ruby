require_relative '../lib/board.rb'

describe Board do

  describe "#new" do
    it "initializes a Board instance with an instance variable @data equal to an array of 9 empty strings" do 
      @board = Board.new
      expected_output = ["","","","","","","","",""]
      expect(@board.data).to eq(expected_output)
    end
  end

end
