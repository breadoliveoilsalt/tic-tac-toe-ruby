require_relative '../lib/three_by_three_ttt_board.rb'

describe ThreeByThreeTTTBoard do

  let(:board) { ThreeByThreeTTTBoard.new }

  describe "#new" do
    it "initializes a Board instance with an instance variable @data equal to an array of 9 empty strings" do 
      expected_data = [" "," ", " ", " ", " ", " ", " ", " ", " "]
      expect(board.data).to eq(expected_data)
    end

    it "initializes a Board instance with provided state" do
      prefilled_board = ThreeByThreeTTTBoard.new(["X", "O", "X", " ", " ", " ", " ", " ", " "]) 
      expected_data = ["X", "O", "X", " ", " ", " ", " ", " ", " "]
      expect(prefilled_board.data).to eq(expected_data)
    end
  end

  describe "#place_marker_on_board_box" do
    it "places a marker in the data accoring to the box selected" do 
      board.place_marker_on_board_box("X", 9)
      expected_data = [" "," ", " ", " ", " ", " ", " ", " ", "X"]
      expect(board.data).to eq(expected_data)
    end
  end

describe "#display_current_board" do
    it "prints to terminal a user friendly version of the board that is empty after initialization" do
      expected_message_to_terminal = <<~MESSAGE
           |   |   
        -----------
           |   |  
        -----------
           |   |  

      MESSAGE

      expect{ board.display_current_board}.to output(expected_message_to_terminal).to_stdout
    end

    it "prints to the terminal a user friendly version of the board that reflects past moves" do
      board.place_marker_on_board_box("X", 1)
      board.place_marker_on_board_box("O", 9)
      expected_message_to_terminal = <<~MESSAGE
         X |   |   
        -----------
           |   |  
        -----------
           |   | O

      MESSAGE
      expect{ board.display_current_board }.to output(expected_message_to_terminal).to_stdout
    end
  end

  describe "#display_board_with_numbers" do 
    it "displays the board with numbers in the boxes" do
      expected_message_to_terminal = <<~MESSAGE
         1 | 2 | 3 
        -----------
         4 | 5 | 6
        -----------
         7 | 8 | 9

      MESSAGE
      expect{ board.display_board_with_numbers}.to output(expected_message_to_terminal).to_stdout
    end
  end

  describe "#box_is_empty?" do 
    it "returns true when the box number passed in is equal to a string with a space" do
      expect(board.box_is_empty?(3)). to eq(true)
    end

    it "returns false when the box number passed in is not equal to a string with a space" do
      board = ThreeByThreeTTTBoard.new(
        [" ", " ", "X", 
         " ", " ", " ", 
         " ", " ", " "]
      )
      expect(board.box_is_empty?(3)). to eq(false)
    end

  end
  
  describe "#game_won?" do
    it "returns false when all boxes are empty" do
      expect(board.game_won?).to eq(false)
    end

    it "returns true when the first row consists of the same markers and not blank spaces" do 
      board = ThreeByThreeTTTBoard.new(
        ["X", "X", "X", 
         " ", " ", " ", 
         " ", " ", " "]
      )
      expect(board.game_won?).to eq(true)
    end

    it "returns true when the same markers on left-to-right diagonal" do 
      board = ThreeByThreeTTTBoard.new(
        ["O", " ", " ", 
         " ", "O", " ", 
         " ", " ", "O"]
      )
      expect(board.game_won?).to eq(true)
    end
  end

  describe "#game_tied?" do
    it "returns false when all boxes are empty" do
      expect(board.game_tied?). to eq(false)
    end

    it "returns false when the game is won" do 
      board = ThreeByThreeTTTBoard.new(
        ["X", "X", "X", 
         " ", " ", " ", 
         " ", " ", " "]
      )
      expect(board.game_tied?).to eq(false)
    end

    it "returns false when the game is not won but there are empty boxes" do
      board = ThreeByThreeTTTBoard.new(
        ["X", " ", "X", 
         " ", " ", " ", 
         " ", " ", " "]
      )
      expect(board.game_tied?).to eq(false)
    end
  end

  describe "#game_over?" do 
    it "returns false upon initialization when board is empty" do
      expect(board.game_over?).to eq(false)
    end

    it "returns true when the game is won" do
      board = ThreeByThreeTTTBoard.new(
        ["X", "X", "X", 
         " ", " ", " ", 
         " ", " ", " "]
      )
      expect(board.game_over?).to eq(true)
    end
    
    it "returns true when the game is tied" do
      board = ThreeByThreeTTTBoard.new(
        ["X", "X", "O", 
         "O", "O", "X", 
         "X", "X", "O"]
      )
      expect(board.game_over?).to eq(true)
    end
  end

  describe "#rows" do
    it "returns all the board's rows" do
      board = ThreeByThreeTTTBoard.new(
        ["X", "X", "O", 
         "O", "O", "X", 
         "X", "X", "O"]
      )
      expect(board.rows).to eq(
        [["X", "X", "O"], 
         ["O", "O", "X"], 
         ["X", "X", "O"]]
      )
    end
  end
  
  describe "#columns" do
    it "returns all the board's columns" do
      board = ThreeByThreeTTTBoard.new(
        ["X", "X", "O", 
         "O", "O", "X", 
         "X", "X", "O"]
      )
      expect(board.columns).to eq(
        [["X", "O", "X"], 
         ["X", "O", "X"], 
         ["O", "X", "O"]]
      )
    end
  end
  
  describe "#columns" do
    it "returns all the board's diagonals" do
      board = ThreeByThreeTTTBoard.new(
        ["X", "X", "O", 
         "O", "O", "X", 
         "X", "X", "O"]
      )
      expect(board.diagonals).to eq(
        [["X", "O", "O"], 
         ["X", "O", "O"]]
      )
    end
  end

  describe "#valid_marker?" do
    it "returns true if passed a capital X" do
      expect(board.valid_marker?("X")).to eq(true)
    end
    
    it "returns true if passed a lower case x" do
      expect(board.valid_marker?("x")).to eq(true)
    end
    
    it "returns true if passed a capital O" do
      expect(board.valid_marker?("O")).to eq(true)
    end
    
    it "returns true if passed a lower case o" do
      expect(board.valid_marker?("o")).to eq(true)
    end
    
    it "returns false if passed any other character" do 
      expect(board.valid_marker?("4")).to eq(false)
      expect(board.valid_marker?("Y")).to eq(false)
      expect(board.valid_marker?("p")).to eq(false)
    end
  end

  describe "#valid_move?" do
    it "returns true when it is passed the box number for an empty box" do
      expect(board.valid_move?(1)).to eq(true)
    end
    
    it "returns false when it is passed the box number for a taken box" do
      board = ThreeByThreeTTTBoard.new(
        ["X", " ", " ", 
         " ", " ", " ", 
         " ", " ", " "]
      )
      expect(board.valid_move?(1)).to eq(false)
    end
  end

end
