require 'require_all'
require_all 'lib'

describe TicTacToeGame do

 let(:board_double) { instance_double("Board") }
 let(:rules_double) { instance_double("Rules") }
 let(:user_interface_double) { instance_double("ConsoleUserInterface") }
 let(:human_player_double) { instance_double("HumanPlayer") }
 let(:computer_player_double) { instance_double("ComputerPlayer") }

 let(:game) { TicTacToeGame.new(
   {  board: board_double,
      rules: rules_double,
      user_interface: user_interface_double,
      players: [human_player_double, computer_player_double]
   })}

  it "requires initialization with a hash" do 
    expect{ TicTacToeGame.new }.to raise_error.with_message("wrong number of arguments (given 0, expected 1)")
  end

  describe "#play_game" do

    it "calls #implement_turn for so long as rules.game_over?(board) returns false" do
      allow(rules_double).to receive(:game_over?).with(board_double).and_return(false, false, false, true)
      allow(game).to receive(:implement_turn).and_return(nil, nil, nil)
      allow(game).to receive(:handle_game_over).and_return(nil)

      game.play_game

      expect(game).to have_received(:implement_turn).exactly(3).times
    end

    it "calls #handle_game_over once rules.game_over?(board) returns true" do
      allow(rules_double).to receive(:game_over?).with(board_double).and_return(false, false, false, false, false, true)
      allow(game).to receive(:implement_turn).and_return(nil, nil, nil, nil, nil)
      allow(game).to receive(:handle_game_over).and_return(nil)

      game.play_game

      expect(game).to have_received(:handle_game_over).once
    end
  end

  describe "#implement_turn" do

    it "displays the board by calling #user_interface.show_current_board(board)" do
      player_selection = "1"
      allow(human_player_double).to receive(:make_selection).and_return(player_selection)
      allow(human_player_double).to receive(:marker).and_return("X")
      allow(rules_double).to receive(:valid_move?).with(board_double, player_selection).and_return(true)
      allow(board_double).to receive(:place_marker_on_board_box).with("X", "1")
      allow(user_interface_double).to receive(:show_move_confirmation)
      allow(rules_double).to receive(:game_over?).with(board_double).and_return(false)

      expect(user_interface_double).to receive(:show_current_board).with(board_double)

      game.implement_turn

    end
  end
end
