class ThreeByThreeTTTUserInterface

  def render_user_welcome
    puts <<~MESSAGE
        
      Welcome to Tic Tac Toe!

    MESSAGE
  end

  def render_instructions
    puts <<~MESSAGE
        
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

  def render_board_with_numbers
    puts <<~MESSAGE

       1 | 2 | 3 
      -----------
       4 | 5 | 6
      -----------
       7 | 8 | 9
   
    MESSAGE
  end

  def render_current_board(board)
    puts <<~MESSAGE
    
       #{board.contents_at_box("1")} | #{board.contents_at_box("2")} | #{board.contents_at_box("3")}
      -----------
       #{board.contents_at_box("4")} | #{board.contents_at_box("5")} | #{board.contents_at_box("6")}
      -----------
       #{board.contents_at_box("7")} | #{board.contents_at_box("8")} | #{board.contents_at_box("9")}

    MESSAGE
  end

  def render_generic_user_selection_error
    puts <<~MESSAGE 

      Sorry, invalid selection.

    MESSAGE
  end

  def render_request_to_select_box(player)
    puts <<~MESSAGE 

      #{player.name}, please select a box and hit return.

    MESSAGE
  end

  def render_confirmation_of_move(player, box_number)
    puts <<~MESSAGE 

      #{player.name} has selected box #{box_number.to_s}.

    MESSAGE
  end

  def render_message_game_won_by(player)
    puts <<~MESSAGE 

        #{player.name} wins!

        Thanks for playing!

    MESSAGE
  end

  def render_message_game_tied
    puts <<~MESSAGE 

        Tie game!

        Thanks for playing!

    MESSAGE
  end
  
  def render_message_play_again?
    puts <<~MESSAGE

      Would you like to play again? Type 'y' or 'Y' and hit return if so.

   MESSAGE
  end

  def render_good_bye
    puts <<~MESSAGE

      Thanks for playing! Good bye!

   MESSAGE
  end
end
