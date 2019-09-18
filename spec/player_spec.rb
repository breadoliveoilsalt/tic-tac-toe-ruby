require_relative '../lib/player.rb'

describe Player do

  it "exists" do 
    expect(described_class).to equal(Player)
  end

	describe "#new" do
    it "initializes with a #marker as an empty string" do
      player = Player.new
      expect(player.marker).to eq("")
    end

    it "initializes with a #player equal to 'Player'" do
      player = Player.new
      expect(player.name).to eq("Player")
    end
  end
  
  
end
