require_relative '../lib/human_player.rb'
require_relative '../lib/player.rb'

describe HumanPlayer do

  let(:human_player) { HumanPlayer.new }

  it "is a subclass of the Player class" do
    expect(HumanPlayer.superclass).to eq(Player)
  end

  describe "#provide_name" do
    
    it "calls read_line (inherited from Player < UserInput) and sets name to the user input" do
      allow(human_player).to receive(:read_line).and_return("Betty")
      human_player.provide_name

      expect(human_player.name).to eq("Betty")
    end
  
  end

  describe "#make_selection" do 

    it "calls read_line" do 
      allow(human_player).to receive(:read_line).and_return("X")
      human_player.make_selection
      expect(human_player.make_selection).to eq("X")
    end

  end
end

