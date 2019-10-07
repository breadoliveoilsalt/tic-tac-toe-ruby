require_relative '../lib/three_by_three_ttt_computer_player.rb'
require_relative '../lib/player.rb'
require_relative '../lib/three_by_three_ttt_board.rb'

describe ThreeByThreeTTTComputerPlayer do

  let(:computer_player) { ThreeByThreeTTTComputerPlayer.new }

  it "is a subclass of the Player class" do
    expect(ThreeByThreeTTTComputerPlayer.superclass).to eq(Player)
  end

  describe "#set_ai" do
    it "sets the instance variable @ai" do 
      ai_double = double("ai double")
      computer_player.set_ai(ai_double)

      expect(computer_player.ai).to eq(ai_double)
    end
  end

  describe "#make_selection" do 
    it "calls ai.find_best_move and passes it the board" do
      ai = double("ai double")
      board = double("board")
      computer_player.set_ai(ai)
      
      expect(ai).to receive(:find_best_move).with(board)
      computer_player.make_selection(board)
    end
  end

 end
