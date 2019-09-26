require_relative '../lib/tic_tac_toe_game.rb'

describe TicTacToeGame do 

  let(:game) { TicTacToeGame.new }

  it "exists" do 
    expect(described_class).to equal(TicTacToeGame)
  end

end
