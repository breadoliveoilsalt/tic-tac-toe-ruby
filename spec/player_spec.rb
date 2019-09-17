require_relative '../lib/player.rb'

RSpec.describe Player do

  it "exists" do 
    expect(described_class).to equal(Player)
  end

	describe "#new" do
    it "initializes with a #token as an empty string" do
      player = Player.new
      expect(player.token).to eq("")
    end
  end

end
