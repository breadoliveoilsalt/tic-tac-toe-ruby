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

end
#  describe "#make_selection" do 
#
#    it "sends a #read_line message to the object injected as @input_stream" do 
#      expect(input_stream).to receive(:read_line)
#      human_player.make_selection
#    end
#
#  end
#end

#  describe "#provide_name" do
#      
#    it "sends a #read_line message to the object injected as @input_stream" do 
#      expect(input_stream).to receive(:read_line)
#      human_player.provide_name
#    end
#
#    it "sets the name attribute for the Human Player instance" do
#      allow(input_stream).to receive(:read_line).and_return("Bob")
#      human_player.provide_name
#      expect(human_player.name).to eq("Bob")
#    end
#
#  end
#
#end
