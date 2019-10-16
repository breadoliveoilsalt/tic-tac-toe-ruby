class Minimax 

  attr_reader :rules, :deciding_player, :opponent

  def initialize(rules:)
    @rules = rules
  end

  def find_best_move(board, deciding_player, opponent)
    @deciding_player = deciding_player
    @opponent = opponent

    best_move = nil
    best_score = -Float::INFINITY
    starting_depth = 0

    (1..board.data.length).each do | box_number |
      if rules.box_is_empty?(board, box_number)
        board.place_marker_on_board_box(deciding_player.marker, box_number)
        test_score = get_score_for_this_move(board: board, depth: 1, current_player: opponent)
        if test_score > best_score
          best_move = box_number
          best_score = test_score
        end
        board.place_marker_on_board_box(" ", box_number)
      end
    end
    best_move.to_s
  end

  def get_score_for_this_move(board: , depth: , current_player: )
    if rules.player_won_game?(board, deciding_player)
      return board.data.length + 1 - depth
    elsif rules.player_won_game?(board, opponent)
      return -1 * (board.data.length + 1 - depth)
    elsif rules.game_tied?(board)
      return 0
    end

    if current_player == deciding_player
      best_score = -Float::INFINITY
      (1..board.data.length).each do | box_number |
        if rules.box_is_empty?(board, box_number)
          board.place_marker_on_board_box(current_player.marker, box_number)
          test_score = get_score_for_this_move(board: board, depth: depth + 1, current_player: opponent)
          best_score = [best_score, test_score].max
          board.place_marker_on_board_box(" ", box_number)
        end
      end
      return best_score
    end
 
    if current_player == opponent
      best_score = Float::INFINITY
      (1..board.data.length).each do | box_number |
        if rules.box_is_empty?(board, box_number)
          board.place_marker_on_board_box(current_player.marker, box_number)
          test_score = get_score_for_this_move(board: board, depth: depth + 1, current_player: deciding_player)
          best_score = [best_score, test_score].min
          board.place_marker_on_board_box(" ", box_number)
        end
      end
      return best_score
    end
  end
end
