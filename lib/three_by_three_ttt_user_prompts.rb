module ThreeByThreeTTTUserPrompts

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
        Players take turns selecting empty boxes.
        A player selects a box by picking a number corresponding
        to that box. 
        A player wins by filling a row, column, or diagonal 
        with only that player's marker.
        If all boxes are filled without a win, the game is a tie.

        MESSAGE
  end

end
