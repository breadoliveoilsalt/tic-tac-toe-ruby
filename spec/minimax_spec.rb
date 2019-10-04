require_relative '../lib/minimax.rb'
require_relative '../lib/three_by_three_ttt_board.rb'  
require_relative '../lib/three_by_three_ttt_rules.rb'

describe Minimax do 

  describe "#find_best_move(board)" do 

     describe "when computer player goes first with O marker" do 

       it "returns the last box number as a string when the O marker can win by filling in the last box and all other boxes have been taken" do 
          board = ThreeByThreeTTTBoard.new(["O", "X", "O", 
                                            "X", "O", "X", 
                                            "X", "O", " "])

          expect(Minimax.find_best_move(board)).to eq("9")
       end

     end

  end

end
