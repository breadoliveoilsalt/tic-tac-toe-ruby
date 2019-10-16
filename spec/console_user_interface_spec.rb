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

  describe "#show_move_confirmation" do

    it "sends messages a move_confirmation message and sends output_stream a render message with the return value" do 
      player = "player"
      move = "move"

      expect(messages_double).to receive(:move_confirmation).with(player, move)
      
      allow(messages_double).to receive(:move_confirmation).with(player, move).and_return("Expected Argument")

      expect(output_stream_double).to receive(:render).with("Expected Argument")

      user_interface.show_move_confirmation(player, move)
    end
  end

  describe "#show_current_board" do

    it "sends messages a current_board message with the board argument and sends output_stream a render message with the return value" do 
      board = double("board")

      expect(messages_double).to receive(:current_board).with(board)
      
      allow(messages_double).to receive(:current_board).with(board).and_return("Expected Argument")

      expect(output_stream_double).to receive(:render).with("Expected Argument")
user_interface.show_current_board(board)
    end
  end

  describe "#show_selection_error" do

    it "sends messages a selection_error message and sends output_stream a render message with the return value" do 
      expect(messages_double).to receive(:selection_error)
      
      allow(messages_double).to receive(:selection_error).and_return("Expected Argument")

      expect(output_stream_double).to receive(:render).with("Expected Argument")

      user_interface.show_selection_error
    end
  end

  describe "#get_user_selection" do

    it "sends messages a request_user_select_box message with the player as an argument and sends output_stream a render message with the return value" do 
      player = double("player")
      expected_messages_return_value = "Expected Argument"

      expect(messages_double).to receive(:request_user_select_box).with(player)

      allow(messages_double).to receive(:request_user_select_box).with(player).and_return(expected_messages_return_value)
      allow(input_stream_double).to receive(:read_line)

      expect(output_stream_double).to receive(:render).with(expected_messages_return_value)

      user_interface.get_user_selection(player)
    end

    it "sends input_stream a read_line message" do
      player = double("player")
      allow(messages_double).to receive(:request_user_select_box)
      allow(output_stream_double).to receive(:render)
      expect(input_stream_double).to receive(:read_line)

      user_interface.get_user_selection(player)
    end
  end

  describe "#show_game_won_by" do

    it "sends messages a game_won_by message with a player as an argument and sends output_stream a render message with the return value" do 
      player = double("Player")
      expect(messages_double).to receive(:game_won_by).with(player)
      allow(messages_double).to receive(:game_won_by).and_return("Expected Argument")

      expect(output_stream_double).to receive(:render).with("Expected Argument")

      user_interface.show_game_won_by(player)
    end
  end

  describe "#show_game_tied" do

    it "sends messages a game_tied message and sends output_stream a render message with the return value" do 
      expect(messages_double).to receive(:game_tied)
      allow(messages_double).to receive(:game_tied).and_return("Expected Argument")

      expect(output_stream_double).to receive(:render).with("Expected Argument")

      user_interface.show_game_tied
    end
  end

  describe "#get_user_play_again" do

    it "sends messages a request_user_play_again message and sends output_stream a render message with the return value" do 
      expected_messages_return_value = "Expected Argument"
      expect(messages_double).to receive(:request_user_play_again)
      allow(messages_double).to receive(:request_user_play_again).and_return(expected_messages_return_value)
      allow(input_stream_double).to receive(:read_line)

      expect(output_stream_double).to receive(:render).with(expected_messages_return_value)

      user_interface.get_user_play_again
    end

    it "sends input_stream a read_line message" do
      allow(messages_double).to receive(:request_user_play_again)
      allow(output_stream_double).to receive(:render)
      expect(input_stream_double).to receive(:read_line)

      user_interface.get_user_play_again
    end
  end

  describe "#show_good_bye" do

    it "sends messages a good_bye message and sends output_stream a render message with the return value" do 
      expect(messages_double).to receive(:good_bye)
      allow(messages_double).to receive(:good_bye).and_return("Expected Argument")

      expect(output_stream_double).to receive(:render).with("Expected Argument")

      user_interface.show_good_bye
    end
  end

end
