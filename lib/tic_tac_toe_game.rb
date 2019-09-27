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

  def play_game
    nil
  end

  def render_introduction
    user_interface.render_user_welcome
    user_interface.render_instructions
  end
  
  def configure_players
    #uncertain why attr not helping here
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
    user_interface.render_request_to_select_box(current_player.name)
    player_selection = current_player.make_selection(board)
    if rules.valid_move?(board, player_selection)
      board.place_marker_on_board_box(current_player.marker, player_selection)
      user_interface.render_confirmation_of_move(current_player.name, player_selection)
      user_interface.render_current_board(board)
    else
      handle_invalid_box_selection
    end
    advance_to_next_player if game_is_not_over
  end

  def handle_invalid_box_selection
    puts "Sorry, invalid selection."
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
    if board.game_won?
      puts "#{current_player.name} wins! \nThanks for playing!"
    elsif board.game_tied?
      puts "Tie game! \nThanks for playing!"
    end
  end
end
