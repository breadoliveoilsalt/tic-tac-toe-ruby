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
end 
