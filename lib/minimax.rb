class Minimax 

  attr_reader :rules, :deciding_player, :opponent

  def initialize(rules:, deciding_player: , opponent:)
    @rules = rules
    @deciding_player = deciding_player
    @opponent = opponent
  end

  def find_best_move(board, depth = 0) # don't forget to remove default depth if not deeded
    best_move = nil
    best_score = -Float::INFINITY
    starting_depth = 0

    (1..board.data.length).each do | box_number |
      if rules.box_is_empty?(board, box_number)
        test_board = board.dup
        test_board.place_marker_on_board_box(deciding_player.marker, box_number)
        test_score = get_score_for_this_move(board: test_board, depth: starting_depth, current_player: opponent)
        if test_score > best_score
          best_move = box_number
          best_score = test_score
        end
      end
    end
    best_move.to_s
  end

  def get_score_for_this_move(board: , depth: , current_player: )
    if rules.player_won_game?(board, deciding_player)
      return board.data.length + 1 - depth
    elsif rules.player_won_game?(board, opponent)
      return -1 * (board.data.length + 1 + depth) # Figure out if I'm thinking about depth correctly...that it's a penalty
    elsif rules.game_tied?(board)
      return 0
    end

    if current_player == deciding_player
      best_scoore = -Float::INFINITY
      (1..board.data.length).each do | box_number |
        if rules.box_is_empty?(board, box_number)
          test_board = board.dup
          test_board.place_marker_on_board_box(current_player.marker, box_number)
          test_score = get_score_for_this_move(board: test_board, depth: depth + 1, current_player: opponent)
          best_score = [best_score, test_score].max
        end
      end
    end
 
    if current_player == opponent
      best_scoore = Float::INFINITY
      (1..board.data.length).each do | box_number |
        if rules.box_is_empty?(board, box_number)
          test_board = board.dup
          test_board.place_marker_on_board_box(current_player.marker, box_number)
          test_score = get_score_for_this_move(board: test_board, depth: depth + 1, current_player: deciding_player)
          best_score = [best_score, test_score].min
        end
      end
    end
    # add the rest of the stuff to get score - make sure you take min/max when appropriate
    best_score
  end
  
  def run_through_empties
    best_score = -Float::INFINITY
    (1..board.data.length).each do | box_number |
      if rules.box_is_empty?(board, box_number)
        test_board = board.dup
        test_board.place_marker_on_board_box(player.marker, box_number)
        test_score = get_score_for_this_move(board: test_board, depth: starting_depth, deciding_players_turn: true )
        if test_score > best_score
          best_move = box_number
          best_score = test_score
        end
      end
    end
  end
    

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

