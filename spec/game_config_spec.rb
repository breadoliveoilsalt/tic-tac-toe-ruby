require 'require_all'
require_all 'lib'

describe GameConfig do

  let(:game_config) { GameConfig.new }
  
  describe "#set_up" do

    it "returns a hash with a key-value pair for board:, rules:, user_interface:, and players:" do 
      allow(game_config).to receive(:player_config).and_return(["Player 1", "Player 2"])
      expected_keys = [:board, :rules, :user_interface, :players]
      keys = game_config.set_up.keys
      expect(keys).to eq(expected_keys)
    end 

    describe "the hash returned by #set_up" do

      it "has a :board value equal to a new instance of the Board" do 
        allow(game_config).to receive(:player_config).and_return(["Player 1", "Player 2"])
        expect(game_config.set_up[:board]).to be_a(Board)
      end

      it "has a :rules value equal to a new instance of the Rules" do 
        allow(game_config).to receive(:player_config).and_return(["Player 1", "Player 2"])
        expect(game_config.set_up[:rules]).to be_a(Rules)
      end

      it "has a :user_interface value equal to a new instance of ConsoleUserInterface" do 
        allow(game_config).to receive(:player_config).and_return(["Player 1", "Player 2"])
        expect(game_config.set_up[:user_interface]).to be_a(ConsoleUserInterface)
      end

      it "has a :players value equal to the value returned sending a #set_up message to an instance of PlayerCofig" do 
        expected_return_value = ["Player 1", "Player 2"]
        player_config_double = double("player config double")
        allow(PlayerConfig).to receive(:new).and_return(player_config_double)
        allow(player_config_double).to receive(:set_up).and_return(expected_return_value) 

        expect(game_config.set_up[:players]).to eq(expected_return_value)
      end
    end
  end
end
