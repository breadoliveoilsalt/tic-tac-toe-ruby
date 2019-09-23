require 'pry'

class TicTacToeGame

  attr_accessor :players
  attr_reader :board, :human_player_model, :current_player_pointer

  def initialize(setup)
    @board = setup[:board]
    @human_player_model = setup[:human_player_model]
    # @computer_player_model = setup.computer_player_model
    @players = []
    @current_player_pointer = 0
  end
  
  def start_game
    display_welcome
    set_up_players
    display_instructions
    players_take_turns_until_game_over
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
    player1.marker = "O"
    players.push(player2)
  end

  def display_instructions
    puts <<~MESSAGE
      Player 1 is X. Player 2 is O.
      
      Players must select a box from 1 - 9.
      
      MESSAGE
    board.display_board_with_numbers
  end

  def players_take_turns_until_game_over
    while game_is_not_over
      current_player_takes_turn
    end
    handle_game_over
  end

  def game_is_not_over
    !board.game_over?
  end

  def current_player_takes_turn
    puts "#{current_player.name}, please select a box to make your move."
    box_number = current_player.make_selection.to_i
    if board.box_is_empty?(box_number)
      board.place_marker_on_board_box(current_player.marker, box_number)
      board.display_current_board
      puts "#{current_player.name} has selected box #{box_number}."
    end
  end

  def current_player
    players[current_player_pointer]
  end

  def handle_game_over

  end
end
