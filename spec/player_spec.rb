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
