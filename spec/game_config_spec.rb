require_relative '../lib/game_config.rb'

describe GameConfig do

  let(:game_config) { GameConfig.new }
  describe "#set_up" do

    it "returns a hash with a key-value pair for board:, rules:, output_stream:, user_view:, and players:" do 
      expected_keys = [:board, :rules, :output_stream, :user_view, :players]
      keys = game_config.set_up.keys
      expect(keys).to eq(expected_keys)
    end 

  end
end
