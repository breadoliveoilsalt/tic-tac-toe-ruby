require_relative '../lib/three_by_three_ttt_player_config.rb'

describe ThreeByThreeTTTPlayerConfig do

  let(:user_interface_double) { double("user interface") }
  let(:player_factory_double) { double("player factory") }

  let(:player_config) { 
    ThreeByThreeTTTPlayerConfig.new(
      user_interface: user_interface_double,
      player_factory: player_factory_double)
     }
  
  it "requires initialization with an argument for user_interface and player_factory" do 
    expect{ 
      ThreeByThreeTTTPlayerConfig.new(
        user_interface: user_interface_double,
        player_factory: player_factory_double)
       }.to_not raise_error

    expect{ 
      ThreeByThreeTTTPlayerConfig.new(
        user_interface: user_interface_double)
       }.to raise_error(ArgumentError)

    expect{ 
      ThreeByThreeTTTPlayerConfig.new(
        player_factory: player_factory_double)
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
