require_relative '../lib/computer_player.rb'
require_relative '../lib/player.rb'
require_relative '../lib/minimax.rb'

describe ComputerPlayer do

  let(:ai_double) { instance_double("Minimax") }
  let(:computer_player) { ComputerPlayer.new( {name: "Computer Player", marker: "X", ai: ai_double} ) }

  it "is a subclass of the Player class" do
    expect(ComputerPlayer.superclass).to eq(Player)
  end

  describe "#new" do
  
    it "accepts as an argument a hash of attributes to set the instance's #name, #marker, and #ai" do
      attributes = {
        name: "1",
        marker: "X",
        ai: ai_double}

      computer_player = ComputerPlayer.new(attributes)     

      expect(computer_player.name).to eq("1")
      expect(computer_player.marker).to eq("X")
      expect(computer_player.ai).to eq(ai_double)
    end

  end

  describe "#make_selection" do 
  
    it "calls ai.find_best_move and passes it the board, deciding_player, and other_player arguments" do
      board = double("board")
      deciding_player = computer_player
      other_player = double("human player")
      
      allow(ai_double).to receive(:find_best_move).with(board, deciding_player, other_player).and_return("7")
      move = computer_player.make_selection(board, deciding_player, other_player)
      
      expect(move).to eq("7")
    end
  end

 end
