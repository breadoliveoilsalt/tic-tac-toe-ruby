require_relative '../lib/three_by_three_ttt_player_factory.rb'
require_relative '../lib/human_player.rb'
require_relative '../lib/three_by_three_ttt_computer_player.rb'
require_relative '../lib/console_input_stream.rb'

describe ThreeByThreeTTTPlayerFactory do

  let(:player_factory) { ThreeByThreeTTTPlayerFactory.new }
  
  describe "#new" do

    it "should take as an optional argument a number of players that defaults to 2" do
      expect(player_factory.number_of_players).to eq(2)
    end
 
    it "should update the default value for number of players when instantiated with a keyword argument for number of players" do
      player_factory = ThreeByThreeTTTPlayerFactory.new(number_of_players: 10)
      expect(player_factory.number_of_players).to eq(10)
    end

    it "should take as an optional argument a number of human players that defaults to 1" do
      expect(player_factory.number_of_human_players).to eq(1)
    end
 
    it "should update the default value for number of human players when instantiated with a keyword argument for number of human players" do
      player_factory = ThreeByThreeTTTPlayerFactory.new(number_of_human_players: 4)
      expect(player_factory.number_of_human_players).to eq(4)
    end

    it "should take as an optional argument a human player model that defaults to HumanPlayer class" do
      expect(player_factory.human_player_model).to eq(HumanPlayer)
    end

    it "should take as an optional argument a user input stream framework that defaults to ConsoleInput" do
      expect(player_factory.input_stream).to eq(ConsoleInputStream)
    end

  end

  describe "#configure_players" do
    it "should return an array with an instance of a human player and a computer player" do
      returned_array = player_factory.configure_players
      expect(returned_array[0]).to be_a HumanPlayer
      expect(returned_array[1]).to be_a ThreeByThreeTTTComputerPlayer
    end

    it "should preconfigure the human player with a name of 'User' and a marker of 'X'" do
      human_player = player_factory.configure_players[0]
      expect(human_player.name).to eq("User")
      expect(human_player.marker).to eq("X")
    end

    it "should preconfigure the human player with an input stream of an instance of the ConsoleInput" do
      human_player = player_factory.configure_players[0]
      expect(human_player.input_stream).to be_a(ConsoleInputStream)
    end
  
    it "should preconfigure the computer player with a name of 'Computer Player' and a marker of 'O'" do
      computer_player = player_factory.configure_players[1]
      expect(computer_player.name).to eq("Computer Player")
      expect(computer_player.marker).to eq("O")
    end
  end
end