class TicTacToeGame

  attr_accessor :players, :current_player_pointer, :board, :human_player_model
  # attr_reader :board, :human_player_model

  def initialize(setup)
    @board = setup[:board]
    @human_player_model = setup[:human_player_model]
    # @computer_player_model = setup.computer_player_model
    @players = []
    @current_player_pointer = 0
  end
  
  def start_game #play_game
    user_inteface.display_welcome
    user_interface.display_instructions
    factory.set_up_players
    players_select_boxes_until_game_over 
  end

  def display_welcome
    puts <<~MESSAGE
      
      Welcome to Tic Tac Toe!

      MESSAGE
  end

  def set_up_players
    player1 = human_player_model.new
    player1.name = "Player 1"
    player1.marker = "X"
    players.push(player1)

    player2 = human_player_model.new
    player2.name = "Player 2"
    player2.marker = "O"
    players.push(player2)
  end

  def display_instructions
    puts <<~MESSAGE
      Player 1 is X. Player 2 is O.
      
      Players must select a box from 1 - 9.
      
      MESSAGE
    board.display_board_with_numbers
  end

  def players_select_boxes_until_game_over
    while game_is_not_over
      current_player_selects_box
    end
    handle_game_over
  end

  def game_is_not_over
    !board.game_over?
  end

  def current_player_selects_box
    puts "#{current_player.name}, please select a box to make your move." 
    box_number = current_player.make_selection.to_i
    if board.box_is_empty?(box_number)
      board.place_marker_on_board_box(current_player.marker, box_number)
      puts "#{current_player.name} has selected box #{box_number}.\n "
      board.display_current_board
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
