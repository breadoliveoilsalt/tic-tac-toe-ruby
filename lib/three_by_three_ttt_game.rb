class ThreeByThreeTicTacToeGame

  attr_accessor :players
  attr_reader :board, :human_player_model

  def initialize(setup)
    @board = setup.board
    @human_player_model = setup.human_player_model
    # @computer_player_model = setup.computer_player_model
    @players = []
  end
  
  def start_game
    puts "Welcome to Tic Tac Toe!"
    set_up_players
    display_instructions




  end

  def set_up_players
    player1 = human_player_model.new
    player1.name = "Player 1"
    player1.maker = "X"
    players.push(player1)

    player2 = human_player_model.new
    player2.name = "Player 2"
    player1.maker = "O"
    players.push(player2)
  end

  def display_instructions
    puts "Player 1 is X. Player 2 is O."
    puts "Players must select a box from 1 - 9."
    board.display_board_with_numbers

  end
end
