require 'require_all'
require_all 'lib'

describe TicTacToeGame do  

  before(:each) do
    board = instance_double("ThreeByThreeTTTBoard")
    rules = instance_double("ThreeByThreeTTTRules")
    user_interface = instance_double("ThreeByThreeTTTUserInterface")
    human_player = instance_double("HumanPlayer")
    computer_player = instance_double("ThreeByThreeTTTComputerPlayer")
    
    game = TicTacToeGame.new({
      board: board,
      rules: rules,
      user_interface: user_interface,
      human_player: human_player,
      computer_player: computer_player
      })
  end

  it "exists" do 
    expect(described_class).to equal(TicTacToeGame)
  end

  describe "#play_game" do
    
    xit "calls user_interface.welcome_user" do

    end
  end

end
