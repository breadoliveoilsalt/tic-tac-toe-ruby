require 'require_all'
require_all 'lib'

describe TicTacToeGame do  

  attr_accessor :board, :rules, :user_interface, :player_factory, :game

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

  it "exists" do 
    expect(described_class).to equal(TicTacToeGame)
  end

  describe "#start_game" do
    
    it "calls user_interface.render_user_welcome" do
      expect(user_interface).to receive(:render_user_welcome)
      game.start_game
    end
  end

end
