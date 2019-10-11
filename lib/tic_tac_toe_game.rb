require 'require_all'
require_all 'lib'

class TicTacToeGame

  attr_accessor :board
  attr_reader :rules, :user_interface, :players 

  def initialize(configuration)
    @board = configuration[:board]
    @rules = configuration[:rules]
    @user_interface = configuration[:user_interface]
    @players = configuration[:players]
  end

  def play_game
    while game_is_not_over
      current_player_selects_box
      advance_to_next_player if game_is_not_over
    end
    handle_game_over
  end

  def game_is_not_over
    !rules.game_over?(board)
  end

  def current_player_selects_box
    user_interface.show_current_board(board)
    player_selection = current_player.make_selection(board, current_player, opponent)
    if rules.valid_move?(board, player_selection)
      board.place_marker_on_board_box(current_player.marker, player_selection)
      user_interface.show_move_confirmation(current_player, player_selection)
    else
      handle_invalid_box_selection
    end
  end

  def handle_invalid_box_selection
    user_interface.show_selection_error
    current_player_selects_box
  end
  
  def advance_to_next_player
    done_player, next_player = players
    @players = [next_player, done_player]
  end

  def handle_game_over
    user_interface.show_current_board(board)
    display_game_over_message
    ask_user_to_play_again
  end

  def display_game_over_message
    if rules.game_won?(board)
      user_interface.show_game_won_by(current_player)
    elsif rules.game_tied?(board)
      user_interface.show_game_tied
    end
  end

  def ask_user_to_play_again
    user_decision = user_interface.get_user_play_again
    if user_decision == "y" || user_decision == "Y"
      reset_game
    else
      user_interface.show_good_bye
    end
  end

  def reset_game
    board.clear_board
    advance_to_next_player
    play_game
  end

  def current_player
    players.first
  end
  
  def opponent
    players.last
  end
end
