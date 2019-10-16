require 'require_all'
require_all 'lib'

describe GameConfig do

  let(:player_factory_double) { instance_double("PlayerFactory") }
  let(:game_config) { GameConfig.new(player_factory_double) }
  
  it "requires passing in a player_factory argument on initializing an instance" do
    expect{ GameConfig.new }.to raise_error(ArgumentError).with_message("wrong number of arguments (given 0, expected 1)")

  end

  describe "#set_up" do

    before(:each) do
      allow(player_factory_double).to receive(:set_up).and_return(["Player 1", "Player 2"])
    end

    it "returns a hash with a key-value pair for board:, rules:, user_interface:, and players:" do 
      expected_keys = [:board, :rules, :user_interface, :players]
      keys = game_config.set_up.keys
      expect(keys).to eq(expected_keys)
    end 

    describe "the hash returned by #set_up" do

      it "has a :board value equal to a new instance of the Board" do 
        expect(game_config.set_up[:board]).to be_a(Board)
      end

      it "has a :rules value equal to a new instance of the Rules" do 
        expect(game_config.set_up[:rules]).to be_a(Rules)
      end

      it "has a :user_interface value equal to a new instance of ConsoleUserInterface" do 
        expect(game_config.set_up[:user_interface]).to be_a(ConsoleUserInterface)
      end

      it "has a :players value equal to the value returned sending a #set_up message to an instance of PlayerCofig" do 
        expected_return_value = ["Player 1", "Player 2"]
        allow(player_factory_double).to receive(:set_up).and_return(expected_return_value) 

        expect(game_config.set_up[:players]).to eq(expected_return_value)
      end
    end
  end
end
