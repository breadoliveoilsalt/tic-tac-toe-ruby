require_relative '../lib/human_player.rb'
require_relative '../lib/player.rb'

describe HumanPlayer do

  let(:input_stream) { double }
  let(:human_player) { HumanPlayer.new(input_stream: input_stream) }

  it "is a subclass of the Player class" do
    expect(HumanPlayer.superclass).to eq(Player)
  end

  describe "#new" do
  
    it "should raise an ArgumentError if not passed a keywork argument for input_stream" do
      expect{ HumanPlayer.new }.to raise_error(ArgumentError)
    end

  end

  describe "#make_selection" do 

    it "sends a #read_line message to the object injected as @input_stream" do 
      expect(input_stream).to receive(:read_line)
      human_player.make_selection
    end

  end

  describe "#provide_name" do
      
    it "sends a #read_line message to the object injected as @input_stream" do 
      expect(input_stream).to receive(:read_line)
      human_player.provide_name
    end

  end

end
