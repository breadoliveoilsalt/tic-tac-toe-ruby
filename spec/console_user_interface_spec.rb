require_relative '../lib/console_user_interface.rb'

describe ConsoleUserInterface do

  let(:output_stream_double) { double("Output Stream") }
  let(:input_stream_double) { double("Input Stream") }
  let(:messages_double) { double("Messages") }
  let(:user_interface) { 
    ConsoleUserInterface.new(
     output_stream: output_stream_double,
     input_stream: input_stream_double,
     messages: messages_double)
    }
  
  it "requires initialization with an argument for input_stream, output_stream, and messages" do 
    expect{ 
      ConsoleUserInterface.new(
        output_stream: output_stream_double,
        input_stream: input_stream_double,
        messages: messages_double)
       }.to_not raise_error

    expect{ 
      ConsoleUserInterface.new(
        output_stream: output_stream_double,
        messages: messages_double)
       }.to raise_error(ArgumentError)

    expect{ 
      ConsoleUserInterface.new(
        input_stream: input_stream_double)
       }.to raise_error(ArgumentError)

    expect{ 
      ConsoleUserInterface.new(
        messages: messages_double)
       }.to raise_error(ArgumentError)

  end

  describe "#show_welcome" do 

    it "sends output_stream a render message with an argumenat messages.welcome" do
      allow(messages_double).to receive_messages(:welcome => "Expected Argument")
      expect(output_stream_double).to receive(:render).with("Expected Argument")

      user_interface.show_welcome
    end

  end

  describe "#get_player_type(player_number)" do

    it "sends output_stream a render message with messages.player_type?(player_number)" do 
      player_number = "1"
      allow(messages_double).to receive(:player_type?).with(player_number).and_return("Expected Argument")
      allow(input_stream_double).to receive(:read_line)

      expect(output_stream_double).to receive(:render).with("Expected Argument")

      user_interface.get_player_type("1")
    end
  
    it "sends input_stream a read_line message and returns the value" do
      allow(messages_double).to receive(:player_type?)
      allow(output_stream_double).to receive(:render)
      allow(input_stream_double).to receive(:read_line).and_return("2")

      expect(user_interface.get_player_type("1")).to eq("2")
    end

  end
  
  describe "#get_name" do

    it "sends output_stream a render message with messages.name?" do 
      allow(messages_double).to receive(:name?).and_return("Expected Argument")
      allow(input_stream_double).to receive(:read_line)

      expect(output_stream_double).to receive(:render).with("Expected Argument")

      user_interface.get_name
    end
  
    it "sends input_stream a read_line message and returns the value" do
      allow(messages_double).to receive(:name?)
      allow(output_stream_double).to receive(:render)
      allow(input_stream_double).to receive(:read_line).and_return("Benny")

      expect(user_interface.get_name).to eq("Benny")
    end

  end

  describe "#get_marker" do

    it "sends output_stream a render message with messages.marker?" do 
      allow(messages_double).to receive(:marker?).and_return("Expected Argument")
      allow(input_stream_double).to receive(:read_line)

      expect(output_stream_double).to receive(:render).with("Expected Argument")

      user_interface.get_marker
    end
  
    it "sends input_stream a read_line message and returns the value" do
      allow(messages_double).to receive(:marker?)
      allow(output_stream_double).to receive(:render)
      allow(input_stream_double).to receive(:read_line).and_return("X")

      expect(user_interface.get_marker).to eq("X")
    end

  end

  describe "#read_line" do

    it "sends a read_line message to input_stream" do
      expect(input_stream_double).to receive(:read_line)

      user_interface.read_line
    end

  end

end
