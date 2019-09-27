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

  def render_current_board(board_data)
    puts <<~MESSAGE
    
      #{board_data[0]} | #{board_data[1]} | #{board_data[2]} 
     -----------
      #{board_data[3]} | #{board_data[4]} | #{board_data[5]}
     -----------
      #{board_data[6]} | #{board_data[7]} | #{board_data[8]}

    MESSAGE
  end

  def render_generic_user_selection_error
    puts <<~MESSAGE 

      Sorry, invalid selection.

    MESSAGE
  end

  def render_request_to_select_box(name)
    puts <<~MESSAGE 

      #{name}, please select a box and hit return.

    MESSAGE
  end

  def render_confirmation_of_move(name, box_number)
    puts <<~MESSAGE 

      #{name} has selected box #{box_number.to_s}.

    MESSAGE
  end

  def render_message_game_won_by(name)
    puts <<~MESSAGE 

        #{name} wins!

        Thanks for playing!

    MESSAGE
  end

  def render_message_game_tied
    puts <<~MESSAGE 

        Tie game!

        Thanks for playing!

    MESSAGE
  end
end
