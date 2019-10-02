require 'require_all'
require_all 'lib'

class TicTacToeGame

  include ThreeByThreeTTTUserView

  attr_accessor :board, :rules, :user_output, :player_factory, :number_of_players, :number_of_human_players, :players, :current_player_pointer

  def initialize(
    board: ThreeByThreeTTTBoard.new,
    rules: ThreeByThreeTTTRules.new,
    user_output: UserOutput.new,
    player_factory: ThreeByThreeTTTPlayerFactory.new,
    number_of_players: 2,
    number_of_human_players: 1
    )
    @board = board
    @rules = rules
    @user_output = user_output
    @player_factory = player_factory
    @number_of_players = number_of_players
    @number_of_human_players = number_of_human_players
    @players = []
    @current_player_pointer = 0
  end

  def start_game
    render(welcome)
    render(instructions)
    configure_players
    play_game
  end

  def render(message)
    user_output.render(message)
  end
  
  def configure_players
    @players = player_factory.configure_players
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
    render(request_user_select_box(current_player))
    player_selection = current_player.make_selection(board)
    if rules.valid_move?(board, player_selection)
      board.place_marker_on_board_box(current_player.marker, player_selection)
      render(move_confirmation(current_player, player_selection))
      render(current_board(board))
    else
      handle_invalid_box_selection
    end
  end

  def handle_invalid_box_selection
    render(user_selection_error)
    current_player_selects_box
  end
  
  def advance_to_next_player
    if current_player_pointer == players.length - 1
      reset_current_player_pointer
    else
      advance_current_player_pointer
    end
  end

  def reset_current_player_pointer
    @current_player_pointer = 0
  end

  def advance_current_player_pointer
    @current_player_pointer += 1 
  end

  def current_player
    players[current_player_pointer]
  end

  def handle_game_over
    display_game_over_message
    ask_user_to_play_again
  end

  def display_game_over_message
    if rules.game_won?(board)
      render(game_won_by(current_player))
    elsif rules.game_tied?(board)
      render(game_tied)
    end
  end

  def ask_user_to_play_again
    render(request_user_play_again)
    player_selection = gets.chomp
    if player_selection == "y" || player_selection == "Y"
      reset_game
    else
      render(good_bye)
    end
  end

  def reset_game
    board.clear_board
    reset_current_player_pointer
    render(board_with_numbers)
    play_game
  end

end
