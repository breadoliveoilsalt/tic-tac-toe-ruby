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
    current_player, *other_players = players
    @players = other_players.push(current_player)
  end

  def handle_game_over
     puts "Game Over!"
#    display_game_over_message
#    ask_user_to_play_again
  end

#  def display_game_over_message
#    if rules.game_won?(board)
#      render(user_view.game_won_by(current_player))
#    elsif rules.game_tied?(board)
#      render(user_view.game_tied)
#    end
#  end
#
#  def ask_user_to_play_again
#    render(user_view.request_user_play_again)
#    player_selection = gets.chomp
#    if player_selection == "y" || player_selection == "Y"
#      reset_game
#    else
#      render(user_view.good_bye)
#    end
#  end
#
#  def reset_game
#    board.clear_board
#    advance_to_next_player
#    render(user_view.board_with_numbers)
#    play_game
#  end

  def current_player
    players.first
  end
  
  def opponent
    players.last
  end
end
