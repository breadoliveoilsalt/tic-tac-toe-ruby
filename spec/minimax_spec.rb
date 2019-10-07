require_relative '../lib/minimax.rb'
require_relative '../lib/three_by_three_ttt_board.rb'  
require_relative '../lib/three_by_three_ttt_rules.rb'

describe Minimax do 

  let(:computer_player) { double("Computer Player", :marker => "O") }

  let(:human_player) { double("Human Player", :marker => "X") }

  let(:minimax) { Minimax.new(
    rules: ThreeByThreeTTTRules.new,
    deciding_player: computer_player,
    opponent: human_player) }

  describe "#find_best_move(board)" do 

     describe "when computer player goes first with O marker" do 

       it "returns the last box number as a string to win when all other boxes have been taken" do 
          board = ThreeByThreeTTTBoard.new(["O", "X", "O", 
                                            "X", "O", "X", 
                                            "X", "O", " "])

          expect(minimax.find_best_move(board)).to eq("9")
       end

        it "returns the first box number as a string to win when all other boxes have been taken" do 
          board = ThreeByThreeTTTBoard.new([" ", "X", "O", 
                                            "X", "O", "X", 
                                            "X", "O", "O"])

          expect(minimax.find_best_move(board)).to eq("1")
       end

        it "returns a box number of the board that is not the first or last (as a string) to win when all other boxes have been taken" do 
          board = ThreeByThreeTTTBoard.new(["O", "X", "O", 
                                            " ", "X", "X", 
                                            "O", "O", "X"])

          expect(minimax.find_best_move(board)).to eq("4")
       end

        it "returns a box number of the board that is not the first or last (as a string) to win when six boxes have been taken" do 
          board = ThreeByThreeTTTBoard.new(["O", "X", "O", 
                                            "X", "O", "X", 
                                            " ", " ", " "])

          expect(minimax.find_best_move(board)).to eq("7")
       end
       
       it "returns a box number of the board that is not the first or last (as a string) to win when four boxes have been taken" do 
          #board = ThreeByThreeTTTBoard.new(["X", "O", "X", 
          #                                  " ", "O", "X", 
          #                                  " ", " ", " "])

          board = ThreeByThreeTTTBoard.new(["X", "O", "X", 
                                            " ", "O", "X", 
                                            " ", " ", " "])
          
          expect(minimax.find_best_move(board)).to eq("8")
       end

       it "returns a box number of the board (as a string) to block when O marker cannot win and four boxes have been taken" do 
          board = ThreeByThreeTTTBoard.new(["X", "O", "O", 
                                            " ", " ", " ", 
                                            "X", " ", " "])

          expect(minimax.find_best_move(board)).to eq("4")
       end

       it "returns a box number of the board (as a string) to block when O marker cannot win and six boxes have been taken" do 
          board = ThreeByThreeTTTBoard.new(["O", "O", "X", 
                                            " ", " ", "O", 
                                            " ", "X", "X"])

          expect(minimax.find_best_move(board)).to eq("7")
       end

       it "returns a box number of the board that is (as a string) to win when the O marker can either block or win" do
          board = ThreeByThreeTTTBoard.new(["X", "O", "X", 
                                            " ", "O", "X", 
                                            " ", " ", " "])

          expect(minimax.find_best_move(board)).to eq("8")
       end
     end
   end
end
