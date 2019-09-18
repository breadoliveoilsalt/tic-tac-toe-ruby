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
    it "sets the marker instance variable" do
      @player.marker = "X"
      expect(@player.marker).to eq("X")
    end
  end
end

describe HumanPlayer do

  it "is a subclass of the Player class" do
    expect(HumanPlayer.superclass).to eq(Player)
  end
end

