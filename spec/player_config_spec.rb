require_relative '../lib/player_config.rb'
require_relative '../lib/human_player.rb'
require_relative '../lib/computer_player.rb'
require_relative '../lib/console_user_interface.rb'
require_relative '../lib/minimax.rb'

describe PlayerConfig do

  let(:user_interface_double) { instance_double("ConsoleUserInterface") }
  let(:human_player_model) { HumanPlayer }
  let(:computer_player_model) { ComputerPlayer }
  let(:ai_double) { instance_double("Minimax") }

  let(:player_config) { 
    PlayerConfig.new(
      user_interface: user_interface_double,
      human_player_model: human_player_model,
      computer_player_model: computer_player_model,
      ai: ai_double)
     }
  
  it "requires initialization with keyword arguments for user_interface, human_player_model, computer_player_model, and ai" do 

    expect{ 
      PlayerConfig.new(
        user_interface: user_interface_double,
        human_player_model: human_player_model,
        computer_player_model: computer_player_model,
        ai: ai_double)
       }.to_not raise_error

    expect{ 
      PlayerConfig.new
       }.to raise_error.with_message(/missing keywords: user_interface, human_player_model, computer_player_model, ai/)
  
  end

  describe "#set_up" do

    before(:each) do
      allow(user_interface_double).to receive(:show_welcome)
      allow(user_interface_double).to receive(:get_name)
      allow(user_interface_double).to receive(:get_marker)
    end

    it "returns an array of two human players when user_interface.get_player_type returns 1 twice" do
      allow(user_interface_double).to receive(:get_player_type).and_return("1", "1")
      expect(player_config.set_up[0]).to be_a(HumanPlayer)
      expect(player_config.set_up[1]).to be_a(HumanPlayer)
    end
  
    it "returns an array of two computer players when user_interface.get_player_type returns 2 twice" do
      allow(user_interface_double).to receive(:get_player_type).and_return("2", "2")
      expect(player_config.set_up[0]).to be_a(ComputerPlayer)
      expect(player_config.set_up[1]).to be_a(ComputerPlayer)
    end

    it "it calls user_interface.get_name and sets the return value to the players' names" do
      allow(user_interface_double).to receive(:get_player_type).and_return("1", "2")
      allow(user_interface_double).to receive(:get_name).and_return("Billy", "Hank")
      expect(player_config.set_up[0].name).to eq("Billy")
      expect(player_config.set_up[1].name).to eq("Hank")
    end
      
    it "it calls user_interface.get_marker and sets the return value to the players' markers" do
      allow(user_interface_double).to receive(:get_player_type).and_return("1", "2")
      allow(user_interface_double).to receive(:get_marker).and_return("X", "O")
      expect(player_config.set_up[0].marker).to eq("X")
      expect(player_config.set_up[1].marker).to eq("O")
    end
  end

end 
