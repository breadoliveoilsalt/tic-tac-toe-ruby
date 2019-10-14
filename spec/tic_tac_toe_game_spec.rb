require 'require_all'
require_all 'lib'

describe TicTacToeGame do

 let(:board) { instance_double("Board") }
 let(:rules) { instance_double("Rules") }
 let(:user_interface) { instance_double("ConsoleUserInterface") }
 let(:human_player) { instance_double("HumanPlayer") }
 let(:computer_player) { instance_double("ComputerPlayer") }

 let(:game) { TicTacToeGame.new(
   {  board: board,
      rules: rules,
      user_interface: user_interface,
      players: [human_player, computer_player]
   })}

  it "requires initialization with a hash" do 
    expect{ TicTacToeGame.new }.to raise_error.with_message("wrong number of arguments (given 0, expected 1)")
  end
end
