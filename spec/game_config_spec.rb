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

      it "has a :user_view value equal to a new instance of the ThreeByThreeTTTUserView" do 
        expect(game_config.set_up[:user_view]).to be_a(ThreeByThreeTTTUserView)
      end

      it "has a :players value equal to an array with two players" do 
        expect(game_config.set_up[:players]).to be_a(Array)
        expect(game_config.set_up[:players][0]).to be_a(Player)
        expect(game_config.set_up[:players][1]).to be_a(Player)
      end
    end
  end
end
