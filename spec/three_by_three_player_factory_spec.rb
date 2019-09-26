require_relative '../lib/three_by_three_ttt_player_factory.rb'
require_relative '../lib/human_player.rb'
require_relative '../lib/three_by_three_ttt_computer_player.rb'

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
  end

  describe "#configure_players" do
    it "should return an array with an instance of a human player and a computer player" do
      returned_array = player_factory.configure_players
      expect(returned_array[0]).to be_a HumanPlayer
      expect(returned_array[1]).to be_a ThreeByThreeTTTComputerPlayer
    end
  end

end
