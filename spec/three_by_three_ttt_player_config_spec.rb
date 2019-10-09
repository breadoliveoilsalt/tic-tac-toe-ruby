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
  
# How to test that this does what I want it to do?

# If I break things down into different methods, how to indicate they are 
# not public methods while still being able to test?






  describe "#set_up" do

    xit "calls #render_welcome_message_to_user" do
      expect(player_config).to receive(:render_welcome_message_to_user)
      player_config.set_up
    end

    xit "calls #cycle_through_players" do
      expect(player_config).to receive(:cycle_through_players)  
      player_config.set_up
    end  

  end

  describe "#render_welcome_message_to_user" do 

    it "passes a render message to output_stream with a message welcoming the user to Tic Tac Toe" do 
      message = <<~MESSAGE

        ~~~~~~~~~~~~~~~~~~~~~~
        ~~~~~~~~~~~~~~~~~~~~~~

        Welcome to Tic Tac Toe!

              ----------

        Tic Tac Toe is a 2 Player Game.

      MESSAGE

      expect(player_config.output_stream).to receive(:render).with(message)

      player_config.render_welcome_message_to_user
    end
  end

  describe "#cycle_through_players" do
    it "asks the user if Player 1 is a human or computer player" do
      message = <<~MESSAGE

        Is Player 1 a human or computer player? 

        Enter '1' for human or '2' for computer.

      MESSAGE

      expect(player_config.output_stream).to receive(:render).with(message)
      
      player_config.cycle_through_players
    end
  end
end
