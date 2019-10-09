# In general: several tests here to modify and delete.  Keeping for now as models/brainstorming for future.
# 
require 'require_all' 
require_all 'lib'

describe TicTacToeGame do  

  attr_accessor :board, :rules, :user_interface, :player_factory, :game

  describe "TicTacToeGame method calls" do 

    before(:each) do
      @board = instance_double("ThreeByThreeTTTBoard")
      @rules = instance_double("ThreeByThreeTTTRules")
      @user_interface = instance_double("ThreeByThreeTTTUserInterface")
      @player_factory = instance_double("ThreeByThreeTTTPlayerFactory")

      @game = TicTacToeGame.new(
        board: @board,
        rules: @rules,
        #user_interface: @user_interface,
        player_factory: @player_factory
        )
    end

    describe "#configure_players" do 

      it "calls #player_factory.configure_players" do
        expect(player_factory).to receive(:configure_players)
        game.configure_players
      end

      it "sets the players attribute according to the return value of #player_factory.configure_players" do
        allow(player_factory).to receive(:configure_players).and_return([Object.new, Object.new])
        game.configure_players
        expect(game.players.length).to eq(2)
        expect(game.players[0]).to be_a Object
        expect(game.players[1]).to be_a Object
      end

    end

    describe "current_player" do 
 
      it "stores the current player at the head of the players array" do
        player1 = double('player1')
        player2 = double('player2')
        player3 = double('player3')
        stub_player_factory = double
        allow(stub_player_factory).to receive(:configure_players).and_return [player1, player2, player3]
        game.player_factory = stub_player_factory

        game.configure_players
        
        expect(game.current_player).to be player1

        game.advance_to_next_player

        expect(game.current_player).to be player2
        
        game.advance_to_next_player

        expect(game.current_player).to be player3
      end

    end
  end
end
