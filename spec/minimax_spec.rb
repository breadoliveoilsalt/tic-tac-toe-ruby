require_relative '../lib/minimax.rb'
require_relative '../lib/board.rb'  
require_relative '../lib/rules.rb'

describe Minimax do 

  let(:computer_player) { double("Computer Player", :marker => "O") }
  let(:human_player) { double("Human Player", :marker => "X") }

  let(:minimax) { Minimax.new(
    rules: Rules.new
    )}

  describe "#find_best_move(board, deciding_player, opponent)" do 

     describe "when computer player goes first with O marker" do 

       it "returns the last box number as a string to win when all other boxes have been taken" do 
          board = Board.new(["O", "X", "O", 
                                            "X", "O", "X", 
                                            "X", "O", " "])

          expect(minimax.find_best_move(board, computer_player, human_player)).to eq("9")
       end

        it "returns the first box number as a string to win when all other boxes have been taken" do 
          board = Board.new([" ", "X", "O", 
                                            "X", "O", "X", 
                                            "X", "O", "O"])

          expect(minimax.find_best_move(board, computer_player, human_player)).to eq("1")
       end

        it "returns a box number of the board that is not the first or last (as a string) to win when all other boxes have been taken" do 
          board = Board.new(["O", "X", "O", 
                                            " ", "X", "X", 
                                            "O", "O", "X"])

          expect(minimax.find_best_move(board, computer_player, human_player)).to eq("4")
       end

        it "returns a box number of the board that is not the first or last (as a string) to win when six boxes have been taken" do 
          board = Board.new(["O", "X", "O", 
                                            "X", "O", "X", 
                                            " ", " ", " "])

          expect(minimax.find_best_move(board, computer_player, human_player)).to eq("7")
       end
       
       it "returns a box number of the board that is not the first or last (as a string) to win when four boxes have been taken" do 
          board = Board.new(["X", "O", "X", 
                                            " ", "O", "X", 
                                            " ", " ", " "])
          
          expect(minimax.find_best_move(board, computer_player, human_player)).to eq("8")
       end

       it "returns a box number of the board (as a string) to block when O marker cannot win and four boxes have been taken" do 
          board = Board.new(["X", "O", "O", 
                                            " ", " ", " ", 
                                            "X", " ", " "])

          expect(minimax.find_best_move(board, computer_player, human_player)).to eq("4")
       end

       it "returns a box number of the board (as a string) to block when O marker cannot win and six boxes have been taken" do 
          board = Board.new(["O", "O", "X", 
                                            " ", " ", "O", 
                                            " ", "X", "X"])

          expect(minimax.find_best_move(board, computer_player, human_player)).to eq("7")
       end

       it "returns a box number of the board that is (as a string) to win when the O marker can either block or win" do
          board = Board.new(["X", "O", "X", 
                                            " ", "O", "X", 
                                            " ", " ", " "])

          expect(minimax.find_best_move(board, computer_player, human_player)).to eq("8")
       end
     end
   end
end
