class Minimax 

end


# experiment with class method

# do I need to import board rules?
# self.getBestMove(board)

# GeeksforGeeks 
  #evaluator method => 
    # arguments = > board 
    # need a method ot check if board has a win, 
    # who the winning player is, and return 10, -10, or 0 based on who the winner is
    # it returns 10 if winning spots have max, -10 if winning spots have opponent, 0 if no win

  #minimax method => 
    # arguments => board, depth, bool whether maximizer's turn
    # runs evalutor(board) and does something depending on what score it returns
    # if score is 10 or -10 because someone won the game, return 10 or -10 [remember thing about subtracting depth]
    # otherwise if there is a tie game, return 0
    # otherwise [if there is no win and empty spaces]
      # if it's max's turn: find the first empty spot, fill it with max's token, 
        # best score is equal to the max of best or a recursive call of minimax with this new board (it keeps recursing until max won, min won, or there's a tie)
        # ?: when their example makes the recursive call, why does it not switch the players in both cases? third argument is alwasy !isMax


   #findBestMove
    # arguments => the board
    # variables => bestValue [set to something stupid low], bestMove
    # traverse the array.  When it finds empty spot
      # [copy the board]
      # Fill the spot with player's token
      # get the tempValue of that move by calling minimax(board, 0 depth, and says is maximizer's turn is false) 
        # [which gives turn to opponent
      # if tempVal is greater than best val, bestMove equals index and bestVal is updated
    # continue to traverse the array
  # return the bestMove

