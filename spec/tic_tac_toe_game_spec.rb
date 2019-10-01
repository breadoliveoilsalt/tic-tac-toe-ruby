require 'require_all' 
require_all 'lib'

describe TicTacToeGame do  

  attr_accessor :board, :rules, :user_interface, :player_factory, :game

  describe "default attributess" do
    
    let(:game) { TicTacToeGame.new }

    it "has defaults attributes for board, rules, user_interface, player_factory, number_of_players, and number_of_human_players" do

      expect(game.board).to be_a ThreeByThreeTTTBoard
      expect(game.rules).to be_a ThreeByThreeTTTRules
      expect(game.user_interface).to be_a ThreeByThreeTTTUserInterface
      expect(game.player_factory).to be_a ThreeByThreeTTTPlayerFactory 
      expect(game.number_of_players).to eq(2)
      expect(game.number_of_human_players).to eq(1)
    end
  
  end

  describe "TicTacToeGame method calls" do 

    before(:each) do
      @board = instance_double("ThreeByThreeTTTBoard")
      @rules = instance_double("ThreeByThreeTTTRules")
      @user_interface = instance_double("ThreeByThreeTTTUserInterface")
      @player_factory = instance_double("ThreeByThreeTTTPlayerFactory")

      @game = TicTacToeGame.new(
        board: @board,
        rules: @rules,
        user_interface: @user_interface,
        player_factory: @player_factory
        )
    end

    describe "#render_introduction" do
      
      it "calls #user_interface.render_user _welcome and #user_interface.render_instructions" do
        expect(user_interface).to receive(:render_user_welcome)
        expect(user_interface).to receive(:render_instructions)
        game.render_introduction
      end

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
  end
end
