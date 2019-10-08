require_relative '../lib/three_by_three_ttt_player_config.rb'

describe ThreeByThreeTTTPlayerConfig do

  let(:output_stream_double) { double("Output Stream") }
  let(:input_stream_double) { double("Input Stream") }
  let(:player_config) { 
    ThreeByThreeTTTPlayerConfig.new(
     output_stream: output_stream_double,
     input_stream: input_stream_double)
    }

  it "requires initialization with an argument for input_stream and output_stream" do 
    expect{ 
      ThreeByThreeTTTPlayerConfig.new(
        output_stream: output_stream_double,
        input_stream: input_stream_double)
       }.to_not raise_error

    expect{ 
      ThreeByThreeTTTPlayerConfig.new(
        output_stream: output_stream_double)
       }.to raise_error(ArgumentError)

    expect{ 
      ThreeByThreeTTTPlayerConfig.new(
        input_stream: input_stream_double)
       }.to raise_error(ArgumentError)

  end

  describe "#set_up" do 

    it "passes a render message to output_stream with a message welcoming the user to Tic Tac Toe" do 
      message = <<~MESSAGE

        ~~~~~~~~~~~~~~~~~~~~~~
        ~~~~~~~~~~~~~~~~~~~~~~

        Welcome to Tic Tac Toe!

              ----------

        Tic Tac Toe is a 2 Player Game.

      MESSAGE

      expect(player_config.output_stream).to receive(:render).with(message)
      player_config.set_up
    end

  end

end
