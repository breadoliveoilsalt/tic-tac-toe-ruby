require_relative '../lib/three_by_three_ttt_computer_player.rb'
require_relative '../lib/player.rb'
require_relative '../lib/three_by_three_ttt_board.rb'

describe ThreeByThreeTTTComputerPlayer do

  let(:computer_player) { ThreeByThreeTTTComputerPlayer.new }

  it "is a subclass of the Player class" do
    expect(ThreeByThreeTTTComputerPlayer.superclass).to eq(Player)
  end

  describe "#make_selection(board)" do

    it "should select the middle box if it is open" do 
      board = ThreeByThreeTTTBoard.new
      expect(computer_player.make_selection(board)).to eq("5")
    end

    it "selects the first empty box if the middle box is taken" do       
      board = ThreeByThreeTTTBoard.new([" ", " ", " ", " ", "X", " ", " ", " ", " "])
      expect(computer_player.make_selection(board)).to eq("1")
    end

    it "selects the first empty box if the middle box and other boxes are taken" do
      board = ThreeByThreeTTTBoard.new(["X", "O", " ", " ", "X", " ", " ", " ", " "])
      expect(computer_player.make_selection(board)).to eq("3")
    end
  end
 end
