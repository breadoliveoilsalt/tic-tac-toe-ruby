require_relative '../lib/human_player.rb' 
require_relative '../lib/player.rb' 

describe HumanPlayer do

  let(:user_interface_double) { double("user interface") }
  let(:human_player) { HumanPlayer.new({user_interface: user_interface_double}) }

  it "is a subclass of the Player class" do
    expect(HumanPlayer.superclass).to eq(Player)
  end

  describe "#new" do
  
    it "accepts as an argument a hash of attributes to set the instance's #name, #marker, and #user_interface attributes" do
      attributes = {
        name: "Tom",
        marker: "X",
        user_interface: user_interface_double}

      human_player = HumanPlayer.new(attributes)

      expect(human_player.name).to eq("Tom")
      expect(human_player.marker).to eq("X")
      expect(human_player.user_interface).to eq(user_interface_double)
    end

  end

  describe "#make_selection" do 

    it "sends a #get_user_selection message to the object injected as @user_interface, passing itself as an argument" do 
      expect(user_interface_double).to receive(:get_user_selection).with(human_player)
      human_player.make_selection
    end

  end

end
