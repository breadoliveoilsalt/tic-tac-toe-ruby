require_relative '../lib/player.rb'

describe Player do

  before(:each) do 
    @player = Player.new
  end 

  it "exists" do 
    expect(described_class).to equal(Player)
  end

	describe "#new" do
    
    it "initializes with a #marker as an empty string" do
      expect(@player.marker).to eq("")
    end

    it "initializes with a #player equal to 'Player'" do
      expect(@player.name).to eq("Player")
    end
  
  end
  
  describe "#marker" do
   
    it "sets and gets the marker instance variable" do
      @player.marker = "X"
      expect(@player.marker).to eq("X")
    end
    
  end

  describe "#name" do
    it "sets and gets the name instance variable" do
      @player.name = "Tommy"
      expect(@player.name).to eq("Tommy")
    end
  end
end

#describe ThreeByThreeTTTComputerPlayer do
#
#  let(:computer_player) { ThreeByThreeTTTComputerPlayer.new }
#
#  it "is a subclass of the Player class" do
#    expect(ThreeByThreeTTTComputerPlayer.superclass).to eq(Player)
#  end
#
#  describe "#select_box(board)" do
#    it "selects the first box of the board when passed a board array with all empty boxes" do
#      board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
#      expect(computer_player.select_box(board)).to eq(1)
#    end
#
#    it "selects the first empty box of the board when passed a board array with some moves made already" do 
#      board = ["X", "O", " ", " ", " ", " ", " ", " ", " "]
#      expect(computer_player.select_box(board)).to eq(3)
#    end
#  end
# end
