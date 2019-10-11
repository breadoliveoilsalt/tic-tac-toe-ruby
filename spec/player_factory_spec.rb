require_relative '../lib/player_factory.rb'

describe PlayerFactory do

  let(:human_player_model_double) { double("human_player_model_double") }
  let(:player_factory) { PlayerFactory.new }

  describe "#build" do

    it "takes a class as a required argument and an optional argument of a list of attributes that are converted to a hash" do

      expect{ player_factory.build } .to raise_error(ArgumentError)

      allow(human_player_model_double).to receive(:new)
      expect { player_factory.build(human_player_model_double) }.to_not raise_error

      attributes = {name: "Tommy"}
      expect{ player_factory.build(human_player_model_double, attributes) }.to_not raise_error

    end

    it "calls #new on the class argument and passes #new the attributes" do
      
      attributes = {name: "Tommy"}
      expect(human_player_model_double).to receive(:new).with(attributes)

      player_factory.build(human_player_model_double, attributes)
      
    end

  end
end
