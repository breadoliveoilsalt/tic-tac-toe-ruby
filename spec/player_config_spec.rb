require_relative '../lib/player_config.rb'
require_relative '../lib/human_player.rb'
require_relative '../lib/computer_player.rb'

describe PlayerConfig do

  let(:user_interface_double) { double("user interface") }
  let(:player_factory_double) { double("player factory") }
  let(:human_player_model) { HumanPlayer }
  let(:computer_player_model) { ComputerPlayer }
  let(:ai_double) { double("ai") }

  let(:player_config) { 
    PlayerConfig.new(
      user_interface: user_interface_double,
      player_factory: player_factory_double,
      human_player_model: human_player_model,
      computer_player_model: computer_player_model,
      ai: ai_double)
     }
  
  it "requires initialization with keyword arguments for user_interface, player_factory, human_player_model, computer_player_model, and ai" do 

    expect{ 
      PlayerConfig.new(
        user_interface: user_interface_double,
        player_factory: player_factory_double,
        human_player_model: human_player_model,
        computer_player_model: computer_player_model,
        ai: ai_double)
       }.to_not raise_error

    expect{ 
      PlayerConfig.new
       }.to raise_error.with_message(/missing keywords: user_interface, player_factory, human_player_model, computer_player_model, ai/)
  
  end

  describe "#set_up" do

#    it "calls user_interface.show_welcome" do
#      expect(user_interface_double).to receive(:show_welcome)
#    end
#
    it "returns an array of two human players when user_interface.get_player_type returns 1 twice" do
      allow(user_interface_double).to receive(:show_welcome)
      allow(user_interface_double).to receive(:get_player_type).and_return("1", "1")
      allow(user_interface_double).to receive(:get_name).and_return("Billy", "Hank")
      expect(player_config.set_up[0]).to be_a(HumanPlayer)
      expect(player_config.set_up[1]).to be_a(HumanPlayer)
    end
  
    it "returns an array of two computer players when user_interface.get_player_type returns 2 twice" do
      allow(user_interface_double).to receive(:show_welcome)
      allow(user_interface_double).to receive(:get_player_type).and_return("2", "2")
      allow(user_interface_double).to receive(:get_name).and_return("Billy", "Hank")
      expect(player_config.set_up[0]).to be_a(ComputerPlayer)
      expect(player_config.set_up[1]).to be_a(ComputerPlayer)
    end

    it "it calls user_interface.get_name and sets the return value to the players' names" do
      allow(user_interface_double).to receive(:show_welcome)
      allow(user_interface_double).to receive(:get_player_type).and_return("1", "2")
      allow(user_interface_double).to receive(:get_name).and_return("Billy", "Hank")
      expect(player_config.set_up[0].name).to eq("Billy")
      expect(player_config.set_up[1].name).to eq("Hank")
    end
      
  end

end 
