require_relative '../lib/player_factory.rb'

describe PlayerFactory do

  let(:human_player_model_double) { double("human_player_model_double") }
  let(:input_stream_double) { double("input_stream_double") }
  let(:computer_player_model_double) { double("computer_player_model_double") }
  let(:ai_double) { double("ai_double") }

  let(:player_factory) { PlayerFactory.new }
#  it "initializes an instance with a human_player_model, an input_stream, a computer_player_model, and an ai for the computer player" do
#
#    expect { PlayerFactory.new(
#      human_player_model: human_player_model_double,
#      input_stream: input_stream_double,
#      computer_player_model: computer_player_model_double,
#      ai: ai_double)
#      }.not_to raise_error
#
#    expect{ PlayerFactory.new }.to raise_error.with_message(/missing keywords: human_player_model, input_stream, computer_player_model, ai/)
#  end

  describe "#build" do

    it "takes a class as a required argument and an optional argument of a list of attributes that are converted to a hash" do

      expect{ player_factory.build } .to raise_error(ArgumentError)

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
