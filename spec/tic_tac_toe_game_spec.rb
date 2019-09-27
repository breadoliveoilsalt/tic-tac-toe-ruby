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

    describe "#start_game" do
      
      it "calls #user_interface.render_user_welcome" do
        expect(user_interface).to receive(:render_user_welcome)
        game.start_game
      end

    end

  end
end
