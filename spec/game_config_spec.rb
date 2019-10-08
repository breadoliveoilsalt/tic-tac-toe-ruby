require 'require_all'
require_all 'lib'

describe GameConfig do

  let(:game_config) { GameConfig.new }
  
  describe "#set_up" do

    it "returns a hash with a key-value pair for board:, rules:, output_stream:, user_view:, and players:" do 
      expected_keys = [:board, :rules, :output_stream, :user_view, :players]
      keys = game_config.set_up.keys
      expect(keys).to eq(expected_keys)
    end 

    describe "the hash returned by #set_up" do

      it "has a :board value equal to a new instance of the ThreeByThreeTTTBoard" do 
        expect(game_config.set_up[:board]).to be_a(ThreeByThreeTTTBoard)
      end

      it "has a :rules value equal to a new instance of the ThreeByThreeTTTRules" do 
        expect(game_config.set_up[:rules]).to be_a(ThreeByThreeTTTRules)
      end

      it "has a :output_stream value equal to a new instance of ConsoleOutputStreatm" do 
        expect(game_config.set_up[:output_stream]).to be_a(ConsoleOutputStream)
      end

      xit "calls #set_up on an instance of ThreeByThreePlayerConfig to populate the value of the :players key" do 
        player_config = instance_double("ThreeByThreeTTTPlayerConfig") 
        expect(player_config).to receive(:set_up)
        game_config.set_up
      end
    end
  end
end
