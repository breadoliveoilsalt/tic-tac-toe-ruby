require_relative '../lib/player_config.rb'

describe PlayerConfig do

  let(:user_interface_double) { double("user interface") }
  let(:player_factory_double) { double("player factory") }
  let(:human_player_model_double) { double("human model") }
  let(:computer_player_model_double) { double("computer model") }
  let(:ai_double) { double("ai") }

  let(:player_config) { 
    PlayerConfig.new(
      user_interface: user_interface_double,
      player_factory: player_factory_double,
      human_player_model: human_player_model_double,
      computer_player_mode: computer_player_model_double,
      ai: ai_double)
     }
  
  it "requires initialization with keyword arguments for user_interface, player_factory, human_player_model, computer_player_model, and ai" do 

    expect{ 
      PlayerConfig.new(
        user_interface: user_interface_double,
        player_factory: player_factory_double,
        human_player_model: human_player_model_double,
        computer_player_model: computer_player_model_double,
        ai: ai_double)
       }.to_not raise_error

    expect{ 
      PlayerConfig.new
       }.to raise_error.with_message(/missing keywords: user_interface, player_factory, human_player_model, computer_player_model, ai/)
  end
end 
