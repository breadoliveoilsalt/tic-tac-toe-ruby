class ThreeByThreeTTTUserInterface

  def welcome_user  
    puts <<~MESSAGE
        
      Welcome to Tic Tac Toe!

      MESSAGE
  end

  def provide_instructions
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

  def display_board_with_numbers
    puts <<~MESSAGE

       1 | 2 | 3 
      -----------
       4 | 5 | 6
      -----------
       7 | 8 | 9
   
      MESSAGE
  end

  def display_generic_user_selection_error
    puts <<~MESSAGE 

      Sorry, invalid selection.

      MESSAGE
  end
end
