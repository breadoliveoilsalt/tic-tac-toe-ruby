class ConsoleMessages

  def welcome_simple
    <<~MESSAGE
        
      Welcome to Tic Tac Toe!

    MESSAGE
  end

  def welcome
    <<~MESSAGE

      ~~~~~~~~~~~~~~~~~~~~~~
      ~~~~~~~~~~~~~~~~~~~~~~

      Welcome to Tic Tac Toe!

            ----------

      Tic Tac Toe is a 2 Player Game.

    MESSAGE
  end

  def player_type?(player_number)
    <<~MESSAGE

      Is Player #{player_number} a human or computer player? 

      Enter '1' for human or '2' for computer.
    MESSAGE
  end

  def name?
    <<~MESSAGE

      Please enter a name for this player.
    MESSAGE
  end

  def marker?
    <<~MESSAGE

      Please enter a marker for this player. For example, "X" or "O".
    MESSAGE
  end

  def instructions
    <<~MESSAGE
        
        Instructions: 

        There are two players. 
        Player 1's marker is "X" and Player 2's marker is "O".  
        Players take turns selecting empty boxes on a board.
        A player wins by filling a row, column, or diagonal on
        the board with only that player's marker.
        If all boxes on the board are filled without a win, 
        the game is a tie.
        
        A player selects a box by picking a number corresponding
        to that box, as indicated on the board below:

          1 | 2 | 3 
         -----------
          4 | 5 | 6
         -----------
          7 | 8 | 9
    
    MESSAGE
  end

  def board_with_numbers
    <<~MESSAGE

       1 | 2 | 3 
      -----------
       4 | 5 | 6
      -----------
       7 | 8 | 9
   
    MESSAGE
  end

  def current_board(board)
    <<~MESSAGE
    
       #{board.contents_at_box("1")} | #{board.contents_at_box("2")} | #{board.contents_at_box("3")}            1 | 2 | 3
      -----------          -----------
       #{board.contents_at_box("4")} | #{board.contents_at_box("5")} | #{board.contents_at_box("6")}            4 | 5 | 6
      -----------          -----------
       #{board.contents_at_box("7")} | #{board.contents_at_box("8")} | #{board.contents_at_box("9")}            7 | 8 | 9

    MESSAGE
  end

  def selection_error
    <<~MESSAGE 

      Sorry, invalid selection.

    MESSAGE
  end

  def request_user_select_box(player)
    <<~MESSAGE 

      #{player.name}, please select a box and hit return.

    MESSAGE
  end

  def move_confirmation(player, box_number)
    <<~MESSAGE 

      #{player.name} has selected box #{box_number.to_s}.

    MESSAGE
  end

  def game_won_by(player)
    <<~MESSAGE 

        #{player.name} wins!

        Thanks for playing!

    MESSAGE
  end

  def game_tied
    <<~MESSAGE 

        Tie game!

        Thanks for playing!

    MESSAGE
  end
  
  def request_user_play_again 
    <<~MESSAGE

      Would you like to play again? The next player will go first.

      Enter 'y' or 'Y' to play again.

   MESSAGE
  end

  def good_bye
    <<~MESSAGE

      Thanks for playing! Good bye!

   MESSAGE
  end

end
