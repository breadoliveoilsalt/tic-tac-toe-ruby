require 'require_all'
require_all 'lib'

class TicTacToeGame

  attr_accessor :board, :rules, :user_interface, :player_factory, :number_of_players, :number_of_human_players, :players, :current_player_pointer

  def initialize(
    board: ThreeByThreeTTTBoard.new,
    rules: ThreeByThreeTTTRules.new,
    user_interface: ThreeByThreeTTTUserInterface.new,
    player_factory: ThreeByThreeTTTPlayerFactory.new,
    number_of_players: 2,
    number_of_human_players: 1
    )
    @board = board
    @rules = rules
    @user_interface = user_interface
    @player_factory = player_factory
    @number_of_players = number_of_players
    @number_of_human_players = number_of_human_players
    @players = []
    @current_player_pointer = 0
  end

  def start_game
    render_introduction
    configure_players
    play_game
  end

  def render_introduction
    user_interface.render_user_welcome
    user_interface.render_instructions
  end
  
  def configure_players
    @players = player_factory.configure_players
  end

  def play_game
    while game_is_not_over
      current_player_selects_box
    end
    handle_game_over
  end

  def game_is_not_over
    !rules.game_over?(board)
  end

  def current_player_selects_box
    user_interface.render_request_to_select_box(current_player)
    player_selection = current_player.make_selection(board)
    if rules.valid_move?(board, player_selection)
      board.place_marker_on_board_box(current_player.marker, player_selection)
      user_interface.render_confirmation_of_move(current_player, player_selection)
      user_interface.render_current_board(board)
    else
      handle_invalid_box_selection
    end
    advance_to_next_player if game_is_not_over
  end

  def handle_invalid_box_selection
    user_interface.render_generic_user_selection_error
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
      user_interface.render_message_game_won_by(current_player)
    elsif rules.game_tied?(board)
      user_interface.render_message_game_tied
    end
  end

  def ask_user_to_play_again
    user_interface.render_message_play_again?
    player_selection = gets.chomp
    if player_selection == "y" || player_selection == "Y"
      reset_game
    else
      user_interface.render_good_bye
    end
  end

  def reset_game
    board.clear_board
    current_player_pointer = 0
    play_game
  end
end
